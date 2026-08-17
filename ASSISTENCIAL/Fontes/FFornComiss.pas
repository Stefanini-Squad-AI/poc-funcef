unit FFornComiss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, MskEdDlg,
  DBCtrls, ComCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd,
  Wwdbgrid,  wwdblook, Spin, UDocumento, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, URegra, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmFornComiss = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    GroupBox2: TGroupBox;
    wwDBGrid2: TwwDBGrid;
    cmbmotivo: TwwDBLookupCombo;
    Label7: TLabel;
    DataPag: TCMDateTimePicker;
    Label4: TLabel;
    cmb1: TComboBox;
    spin1: TSpinEdit;
    Label5: TLabel;
    qryHistPag: TwwQuery;
    dsforn: TwwDataSource;
    qryforn: TwwQuery;
    dsHstPag: TwwDataSource;
    qry: TwwQuery;
    qryAux: TwwQuery;
    dsAux: TwwDataSource;
    qryRegraIn: TwwQuery;
    dsRegraIn: TwwDataSource;
    qrymotivo: TwwQuery;
    RegraFornPag: TRegra;
    qryRegraOut: TwwQuery;
    qryplano: TwwQuery;
    dsplano: TwwDataSource;
    Memo1: TMemo;
    Label17: TLabel;
    ProgressBar1: TProgressBar;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure wwDBGrid2ColEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryfornAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    function  trazmes(mes : string):string;
    procedure ContabHistRec;
    procedure GeraComissaoFornecedor;
    Procedure deletahst;
  private
    { Private declarations }
  public
   contador : integer;
  refaz : boolean;
  refeito : integer;
  coddoc, NumLancto, idempresa, forn, codtipdoc, codportforma, Usuario : integer;
  CodTipRecDes, DataEmissao, DataVenc, DataProg : string;
  valor : real;
  NoDocumento : integer;
  Documento : TDocumento;
  mens : TModalResult;
    { Public declarations }
  end;

var
  frmFornComiss: TfrmFornComiss;
  cAux : char;

implementation

uses  UAutorizacao, UAdmAss, USistema, UMensErro;

{$R *.DFM}

procedure TfrmFornComiss.bbtnConfirmarClick(Sender: TObject);
var
   i:integer;
begin
  inherited;

  contador := 0;
  cAux := DecimalSeparator;
  DecimalSeparator := '.';

  bbtnCancelar.enabled := false;
  refaz := false;

  if (bforncomiss) and (cmbmotivo.text = '') then
  begin
     showmessage('O motivo padrão para este cálculo não foi definido nos parâmetros do sistema !');
     exit;
  end
  else
    if (not bforncomiss) and (cmbmotivo.text = '') then
    begin
      showmessage(' É preciso selecionar o motivo !');
      bbtnCancelar.enabled := true;
      exit;
    end;

  if DataPag.text = '' then
  begin
    showmessage(' É preciso selecionar a data de pagamento !');
    exit;
    bbtnCancelar.enabled := true;
  end;

  if (cmb1.text = '') then
  begin
    showmessage('A data de referência precisa ser preeenchida !');
    exit;
    bbtnCancelar.enabled := true;
  end;

  qryaux.close;
  qryaux.sql.clear;
  qryaux.sql.add('SELECT FLGIDATMP FROM CTRLINTERFACE '+
                 ' WHERE (TIPO =''G'') AND '+
                       ' (MESREFERENCIA = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''')');
  qryaux.open;

  if (not qryaux.isempty) and (qryaux.fieldbyname('FLGIDATMP').AsInteger = 1) then
  begin
     MsgDlg('As Comissões referentes a este mês de referência já foram enviadas via Interface !','Assistencial', mtconfirmation, [mbOk],0);
     exit;
  end;

  Label17.caption := 'Calculando Comissões...';

  //**********************loop***************************************************//
  if  wwDBGrid2.SelectedList.Count = 0  then
  begin
     qryplano.first;
     while not qryplano.eof do
     begin
        qryAux.close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add
          ('SELECT IDPLANASS FROM HISTREC '+
           ' WHERE (MES = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''') and '+
                 ' (IDPLANASS = '+qryplano.fieldbyname('idplanass').AsString+') AND '+
                 ' (IDMOTIVO = '+qrymotivo.fieldbyname('idmotivo').AsString+')');
        try
          qryAux.open;
        except
        end;

        if not qryAux.isempty  then
        begin
          if  not refaz then
          begin
             mens := MsgDlg('O registro de pagamento do fornecedor do plano :'+
                     qryplano.fieldbyname('nome').AsString+' já foi gerado.'+
                     ' Deseja refazer ?','Assistencial', mtconfirmation,
                     [mbyes,mball,mbabort], 0);
             if mens = mryes then
             begin
                deletaHst;
              //=========
                refaz := false;
             end
             else
               if mens = mrall then
               begin
                 deletaHst;
               //=========
                 refaz := true;
               end
               else
               begin
                 bbtnCancelarClick(self);
                 exit;
               end;
          end
          else
          begin
            deletahst;
          //=========
          end;
        end;

        GeraComissaoFornecedor;
      //======================

        ContabHistRec;
      //=============

        qryplano.next;
        if  ProgressBar1.position = 1000 then
          ProgressBar1.position := 0;
        ProgressBar1.position := ProgressBar1.position + 1;
        //inc(contador);
     end;//while
  end
  else
  begin
     with wwDBGrid2.DataSource.DataSet do
     begin
        for i:=0 to wwDBGrid2.SelectedList.Count-1 do
        begin
          GotoBookmark(wwDBGrid2.SelectedList.items[i]);

          qryAux.close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add
            ('SELECT IDPLANASS FROM HISTREC '+
             ' WHERE (MES = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''') and '+
                   ' (IDPLANASS = '+qryplano.fieldbyname('idplanass').AsString+') AND '+
                   ' (IDMOTIVO = '+qrymotivo.fieldbyname('idmotivo').AsString+') AND '+
                   ' (IDFORNSERV = '+qryplano.fieldbyname('idfornserv').AsString+')');
          try
             qryAux.open;
          except
          end;

          if not qryAux.isempty  then
          begin
             if not refaz then
             begin
                mens := MsgDlg('O registro de pagamento do fornecedor do plano :'+qryplano.fieldbyname('nome').AsString+' já foi gerado.'+' Deseja refazer ?','Assistencial', mtconfirmation, [mbyes,mball,mbabort],0);
                if mens = mryes then
                begin
                   deletaHst;
                 //=========
                   refaz := false;
                end
                else
                  if mens = mrall then
                  begin
                    deletaHst;
                  //=========
                    refaz := true;
                  end
                  else
                  begin
                    bbtnCancelarClick(self);
                    exit;
                  end;
             end
             else
             begin
                deletahst;
              //=========
             end;
          end;

          GeraComissaoFornecedor;
        //======================

          ContabHistRec;
        //=============

          if ProgressBar1.position = 1000 then
            ProgressBar1.position := 0;
          ProgressBar1.position := ProgressBar1.position + 1;
          //inc(contador);
       end;//for
     end;//with
  end;
  //***********************fim-loop**********************************************//

  ProgressBar1.Position := 1000;
  Label17.caption := 'Concluidos  '+inttostr(contador)+'  Registros';
  bbtnConfirmar.enabled := false;
  wwDBGrid1.applyselected;
  wwDBGrid2.applyselected;
  bbtnCancelar.enabled := true;

  DecimalSeparator := cAux;
end;

procedure TfrmFornComiss.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cmb1.text := '';
  if not bforncomiss then
    cmbmotivo.text := '';
  DataPag.text := '';
  ProgressBar1.position := 0;
  label17.caption := '';
  bbtnConfirmar.enabled := true;
  RetornaDataCorr(cmb1,spin1);
  DecimalSeparator := ',';
end;

procedure TfrmFornComiss.bbtnSairClick(Sender: TObject);
begin
  DecimalSeparator := ',';
  inherited;
end;

procedure TfrmFornComiss.wwDBGrid2ColEnter(Sender: TObject);
begin
  inherited;
  wwDBGrid1.ApplySelected;
  wwDBGrid2.ApplySelected;
end;

//OBS: existe esta rotina na lib!!!
function TfrmFornComiss.trazmes(mes : string) : string;
var
   saida : string;
begin
   if mes='JANEIRO'   then saida := '01';
   if mes='FEVEREIRO' then saida := '02';
   if mes='MARÇO'     then saida := '03';  {ACERTAR ESSA ROTINA, TESTAR O MES COM 3 POSICOES}
   {}                                      {}
   if mes='ABRIL'     then saida := '04';
   if mes='MAIO'      then saida := '05';
   if mes='JUNHO'     then saida := '06';
   if mes='JULHO'     then saida := '07';
   if mes='AGOSTO'    then saida := '08';
   if mes='SETEMBRO'  then saida := '09';
   if mes='OUTUBRO'   then saida := '10';
   if mes='NOVEMBRO'  then saida := '11';
   if mes='DEZEMBRO'  then saida := '12';
   trazmes := saida;
end;

procedure TfrmFornComiss.ContabHistRec;
begin
   ////////////////////////////////////////////REGRA////////////////////////////////
   try
      regraFornPag.paramout := 'VALREC';
      RegraFornPag.rulename := qryplano.fieldbyname('idregracomissao').AsString;

      qryregrain.close;
      qryRegrain.sql.clear;
      qryRegrain.sql.add('SELECT SUM(VALOREVENT) FROM EVENTASS '+
                         ' WHERE (IDPLANASS = :IDPLANASS)'+
                            'AND (TO_CHAR(DATAEVENT,''MM'') = '''+trazmes(cmb1.text)+''')');
      qryRegrain.parambyname('idplanass').AsInteger := qryplano.fieldbyname('idplanass').AsInteger;
      qryregrain.open;

      //qryregraout.execsql;
      RegraFornpag.execute;

      //**SELECIONA O VALOR TOTAL DE COMISSÃO
      //**NOS EVENTOS ASSISTENCIAIS
      qryaux.Close;
      qryaux.SQL.clear;
      qryaux.sql.add('SELECT SUM(TOTALCOMISSAO) VALOR  '+
                      ' FROM FORNSERVPLANASS '+
                     ' WHERE (IDPLANASS =  :IDPLANASS)'+
                       ' AND (IDFORNSERV = :IDFORNSERV)'+
                       ' AND (MESREFERENCIA = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''')');
      qryaux.parambyname('idplanass').AsInteger := qryplano.fieldbyname('idplanass').AsInteger;
      qryaux.parambyname('idfornserv').AsInteger := qryplano.fieldbyname('idfornserv').AsInteger;
      try
         qryaux.open;
      except
      end;

      qryregraout.sql.clear;
      qryregraout.sql.add('UPDATE HISTREC SET VALREC = :VALREC '+
                          ' WHERE (IDPLANASS = :IDPLANASS)'+
                            ' AND (IDMOTIVO = :IDMOTIVO)'+
                            ' AND (IDFORNSERV = :IDFORNSERV)'+
                            ' AND (MES = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''')');
      if regrafornpag.result <> '' then
      begin
         qryregraout.parambyname('VALREC').AsFloat := StrToFloat(ClienteNumero(RegraFornpag.result)) + qryaux.fieldbyname('valor').AsFloat;
      end
      else
      begin
         qryregraout.parambyname('VALREC').AsFloat := qryaux.fieldbyname('valor').AsFloat;
      end;

      qryregraout.parambyname('idplanass').AsInteger := qryplano.fieldbyname('idplanass').AsInteger;
      qryregraout.parambyname('idmotivo').AsInteger := qrymotivo.fieldbyname('idmotivo').AsInteger;
      qryregraout.parambyname('idfornserv').AsInteger := qryplano.fieldbyname('idfornserv').AsInteger;

      qryregraout.execsql;

      //***************************Contas a Pagar / Receber ***********************//

      {coddoc := Documento.gerarcoddocumento(qry);

      idempresa := Sistema.idempresa;
      forn := qryforn.fieldbyname('idpessoa').AsInteger;
      codtipdoc := qryplano.fieldbyname('codtipodocHistrec').AsInteger;
      codportforma := 23;
      NoDocumento := strtoint(qryplano.fieldbyname('numcontrato').AsString);
      Usuario := Sistema.idUsuario;
      DataEmissao := '01/'+trazmes(cmb1.text)+'/'+inttostr(spin1.value)+'';
      DataVenc := datapag.text;
      DataProg := datapag.text;
      //Valor := regrafornpag.result;
      valor := 100;
      CodTipRecDes := qryplano.FieldByName('CodTipoRecHistrec').AsString;
      Documento.criardoc(qry,coddoc,'A',-1,-1,idempresa,forn,codtipdoc,codportforma,'R',
      NoDocumento,'',DataEmissao,DataVenc,DataProg,
      '',-1,'2',usuario);
      NumLancto :=Documento.GerarNumLancto(qry,coddoc);
      Documento.CriarLanctoDoc(qry,CodDoc,NumLancto,-1,-1,dataemissao,Valor,0,-1,'C','2'
      ,'Recebimento de Comissão do Fornecedor',usuario);
      Documento.InserirRateioDoc(qry,CodDoc,Codtiprecdes,'R','',idempresa,valor,0,usuario);
      //***************************************************************************//
      qryAux.close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE HISTREC SET CODDOCUMENTO = '+inttostr(coddoc)+' '+
                     ' WHERE MES = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''' and '+
                           ' IDPLANASS = '+qryplano.fieldbyname('idplanass').AsString+' AND '+
                           ' IDMOTIVO = '+qrymotivo.fieldbyname('idmotivo').AsString+' AND '+
                           ' IDFORNSERV = '+qryplano.fieldbyname('idfornserv').AsString+'');
      try
         qryAux.ExecSql;
      except
        raise;
      end;}

      qryregrain.close;
      qryregraout.close;

   except
      qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.add('ROLLBACK');
      qryaux.execsql;
   end;
   ////////////////////////////////CUIDADO//////////////////////////////
end;

procedure TfrmFornComiss.GeraComissaoFornecedor;
begin
   qryAux.close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add
     ('INSERT INTO HISTREC '+
                 ' (MES,IDMOTIVO,IDPLANASS,IDFORNSERV,DATAREC,IDREGRA,VALORRECEBIDO) '+
          ' values('''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''','+
                   qrymotivo.fieldbyname('idmotivo').AsString+','+
                   qryplano.fieldbyname('IDPLANASS').AsString+','+
                   qryplano.fieldbyname('idfornserv').AsString+','+
                   'to_date('''+datapag.text+''',''dd/mm/yyyy''),'''+
                   qryplano.fieldbyname('idregracomissao').AsString+''',0');
   try
     qryAux.ExecSQL;
     inc(contador);
   except
   end;
end;

procedure TfrmFornComiss.FormCreate(Sender: TObject);
begin
  inherited;
  qryforn.open;
  qryplano.open;
  qryhistpag.open;
  if not bforncomiss then
  begin
     qrymotivo.open;
  end
  else
  begin
     qrymotivo.open;
     qrymotivo.locate('idmotivo', idmotivopag, [loPartialKey]);
     cmbmotivo.text := qrymotivo.fieldbyname('descricao').AsString;
  end;
  //contador := qryhistpag.recordcount;
  //qryRegraIn.open;
  //cmMaskEditDlg1.text := datetostr(date);
  bbtnConfirmar.enabled := true;
  wwDBGrid1.applyselected;
  wwDBGrid2.applyselected;
  RetornaDataCorr(cmb1,spin1);
end;

procedure TfrmFornComiss.qryfornAfterScroll(DataSet: TDataSet);
begin
  inherited;
  wwDBGrid1.applyselected;
  wwDBGrid2.applyselected;
  bbtnConfirmar.enabled := true;
  label17.caption := '';
  ProgressBar1.position := 0;
end;

procedure TfrmFornComiss.deletahst;
begin
   // DELETA HISTORICO PARA SER REFEITO
   {qryAux.close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' DELETE HISTPAG '+
                  ' WHERE MES = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''' and '+
                  ' IDPLANASS = '+qryplano.fieldbyname('idplanass').AsString+' AND '+
                  ' IDMOTIVO = '+qrymotivo.fieldbyname('idmotivo').AsString+' AND '+
                  ' IDFORNSERV = '+qryplano.fieldbyname('idfornserv').AsString+'');
   try
        qryAux.ExecSql;
        //Documento.DeletarDoc();
   except end;}

   qryAux.close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('DELETE HISTREC '+
                  ' WHERE (MES = '''+inttostr(spin1.value)+'/'+trazmes(cmb1.text)+''') and '+
                        ' (IDPLANASS = '+qryplano.fieldbyname('idplanass').AsString+') AND '+
                        ' (IDMOTIVO = '+qrymotivo.fieldbyname('idmotivo').AsString+') AND '+
                        ' (IDFORNSERV = '+qryplano.fieldbyname('idfornserv').AsString+')');
   try
     qryAux.ExecSql;
     //Documento.DeletarDoc();
   except
   end;
end;

procedure TfrmFornComiss.FormActivate(Sender: TObject);
begin
  inherited;
  Documento := TDocumento.create;

  if not bforncomiss then
  begin
     cmbmotivo.enabled := true;
  end
  else
  begin
     cmbmotivo.enabled := false;
  end;
end;

end.

