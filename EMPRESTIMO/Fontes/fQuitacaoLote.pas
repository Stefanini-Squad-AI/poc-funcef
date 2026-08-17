unit fQuitacaoLote;

{

Pendência   : SOL 126452 Kintana 660511
Responsável : Renato Visoni
Data        : 10/12/2009
Descrição   : Alterar o Período máximo de busca para 20 dias
--------------------------------------------------------------------------------

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, Wwdatsrc, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, Grids, DBGrids, DBCtrls,
  BfDialogs, BrowseFolder, uProcuraDir, DBClient, wwclient, Wwdbigrd,
  Wwdbgrid,DBaseDados;

type
  TfrmQuitacaoLote = class(TfrmSairAjuda)
    PageControl: TPageControl;
    pgGerarArquivo: TTabSheet;
    pgQuitacaoLote: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnBusca: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    lblQntContratos: TLabel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    btnArqProcessar: TSpeedButton;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    Panel4: TPanel;
    Label11: TLabel;
    lblnContratosQuitacao: TLabel;
    bbtnConfirmar: TBitBtn;
    Panel5: TPanel;
    edtArquivo: TEdit;
    TabSheet1: TTabSheet;
    Label15: TLabel;
    Panel7: TPanel;
    Label16: TLabel;
    lblNcontratoCanc: TLabel;
    BitBtn1: TBitBtn;
    Panel8: TPanel;
    Panel9: TPanel;
    edtDataQuitacaoArquivo: TCMDateTimePicker;
    Panel10: TPanel;
    Panel11: TPanel;
    edtPeriodo1: TCMDateTimePicker;
    Panel12: TPanel;
    edtPeriodo2: TCMDateTimePicker;
    cboTipoEmprestimo: TDBLookupComboBox;
    QryTipoEmprestimo: TwwQuery;
    dsTipoEmprestimo: TwwDataSource;
    cboTipoContrato: TDBLookupComboBox;
    qryTipoContrato: TwwQuery;
    dsTipoContrato: TwwDataSource;
    Panel13: TPanel;
    edtDataCancelamento: TCMDateTimePicker;
    SpeedButton1: TSpeedButton;
    DlgArquivo: TSaveDialog;
    SpeedButton2: TSpeedButton;
    Panel14: TPanel;
    edtDestinoArquivo: TEdit;
    ProcuraDirDlg1: TProcuraDirDlg;
    lblArqGravar: TLabel;
    qryGeraArquivo: TQuery;
    dsGeraArquivo: TDataSource;
    gridGeracao: TwwDBGrid;
    upd: TUpdateSQL;
    QryQuitacaoLote: TQuery;
    dsQuitacaoLote: TDataSource;
    updQuitacao: TUpdateSQL;
    QryInsert: TQuery;
    QryAux: TQuery;
    QryContratosCanc: TQuery;
    dsContratosCanc: TDataSource;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    qryGeraArquivoFLGENVIA: TStringField;
    qryGeraArquivoDATACONTRATACAO: TDateTimeField;
    qryGeraArquivoNUMCONTRATO: TFloatField;
    qryGeraArquivoMATRICULA: TStringField;
    qryGeraArquivoCPF: TStringField;
    qryGeraArquivoNOME: TStringField;
    qryGeraArquivoDATAQUITACAO: TStringField;
    qryGeraArquivoSALDODEVEDOR: TFloatField;
    qryGeraArquivoVALORBRUTO: TFloatField;
    lblValorTotalArquivo: TLabel;
    Label8: TLabel;
    lblValorQuitacao: TLabel;
    Label12: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    pgContratos: TPageControl;
    tb1: TTabSheet;
    tb2: TTabSheet;
    Panel6: TPanel;
    DBGrid3: TDBGrid;
    memResult: TMemo;
    qryGeraArquivoPLANOCONTABIL: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cboTipoEmprestimoCloseUp(Sender: TObject);
    procedure btnArqProcessarClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtDataQuitacaoArquivoCloseUp(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure InsertHistmovemptmo(idItemEmptmo : Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure gridGeracaoDblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    
  private
    { Private declarations }
  public
    FDemonstrativo       : TextFile;
    fValorTotalArquivo   : CURRENCY;
    { Public declarations }
  end;

var
  frmQuitacaoLote: TfrmQuitacaoLote;

implementation
 uses uSistema,FProgresso, UcalcEmptmo,UFuncoesEmptmo,datualizacaoDiaria,UMensErro;
{$R *.DFM}

procedure TfrmQuitacaoLote.FormShow(Sender: TObject);
begin
  inherited;

  QryTipoEmprestimo.Open;
  DlgArquivo.Initialdir    := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  ProcuraDirDlg1.Directory := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

end;

procedure TfrmQuitacaoLote.cboTipoEmprestimoCloseUp(Sender: TObject);
begin
  inherited;

  if (trim(cboTipoEmprestimo.Text) <> '') Then Begin
    qryTipoContrato.Close;
    qryTipoContrato.ParamByname('PIDTIPOEMPTMO').AsString := cboTipoEmprestimo.keyValue;
    qryTipoContrato.Open;
  end;
end;

procedure TfrmQuitacaoLote.btnArqProcessarClick(Sender: TObject);
var Lista : TStringList;
i,itotal : integer;
sCampo, sLinha : String;
fValorQUitacao : Currency;
begin
  inherited;

  lblnContratosQuitacao.Caption :='';
  lblValorQuitacao.Caption      :='';

  i:=0;
  fValorQUitacao :=0;

  If DlgArquivo.Execute Then edtArquivo.Text := DlgArquivo.FileName;
  
  if (trim(edtArquivo.Text)='') then Exit;


  Lista := TStringList.Create;
  Lista.LoadFromFile(edtArquivo.Text);


  QryQuitacaoLote.Close;
  QryQuitacaoLote.Open;


  sCampo :='';
  sLinha :='';
  itotal := 0;
  for i:= 0 to Lista.Count-1 do begin
    sLinha := Lista[i];

    if (pos('Número Contrato',sLinha) = 0) and (pos('Matrícula',sLinha) = 0) and (pos('Saldo Devedor',sLinha) = 0)
        and (pos('Nome',sLinha) = 0) and (pos('CPF',sLinha) = 0) then begin
      sCampo := '';
      QryQuitacaoLote.Append;

      //NumContrato
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('NUMCONTRATO').asString       := sCampo;

      //Matricula
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('MATRICULA').asString         := sCampo;

      //Nome
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('NOME').asString              := sCampo;

      //CPF
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('CPF').asString               := sCampo;

      //Data Quitacao
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('SALDODEVEDOR').asString      := sCampo;

      try
        fValorQUitacao := fValorQUitacao + QryQuitacaoLote.FieldByname('SALDODEVEDOR').asCurrency;
      except
      end;

      //Data Contratacao
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('DATAQUITACAO').asString   := sCampo;

      //Saldo Devedor
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('DATACONTRATACAO').asString      := sCampo;

      //Valor Bruto
      sCampo := Copy(sLinha,1,pos(';',sLinha)-1);
      sLinha := Copy(sLinha,pos(';',sLinha)+1,Length(sLInha));
      QryQuitacaoLote.FieldByname('VALORBRUTO').asString        := sCampo;

      inc(itotal);
      QryQuitacaoLote.Post;
    end;
  end;


  if QryQuitacaoLote.Locate('NUMCONTRATO','',[]) then begin
    QryQuitacaoLote.Delete;
  end;
  QryQuitacaoLote.First;

  lblValorQuitacao.Caption := floatToStr(fValorQUitacao);

  lblnContratosQuitacao.Caption := intTostr(itotal);



end;

procedure TfrmQuitacaoLote.btnBuscaClick(Sender: TObject);
var sSQL, sTipoContrato , sData,sPeriodo1,sPeriodo2: string;

begin
  inherited;

  if edtDataQuitacaoArquivo.Date <= 0 then begin
    messagebox (Handle,'Preencha a Data de Quitação!','Empréstimo', mb_Iconinformation + mb_Ok);
    exit;
  end else begin
    if (edtDataQuitacaoArquivo.Date > ((Now)+20)) then begin //Renato Visoni SOL 126452 Kintana 660511
      messagebox (Handle,'Não é possível gerar arquivo para período superior a vinte dias contados a partir da data atual.','Empréstimo', mb_Iconinformation + mb_Ok);
      edtDataQuitacaoArquivo.SetFocus;
    end;
  end;


  if ((edtPeriodo1.Date <= 0) or (edtPeriodo2.Date <= 0)) then begin
    Messagebox (Handle,'Preencha o Período das Concessões.','Empréstimo', mb_Iconinformation + mb_Ok);
    exit;
  end else begin
    if edtPeriodo1.Date > edtPeriodo2.Date then begin
      Messagebox (Handle,'A data final deve ser igual ou maior que a data inicial para o período informado.','Empréstimo', mb_Iconinformation + mb_Ok);
      exit;
    end;
  end;

  if cboTipoEmprestimo.Text='' then begin
    Messagebox (Handle,'Preencha o Tipo de Empréstimo.','Empréstimo', mb_Iconinformation + mb_Ok);
    exit;
  end;


  sTipoContrato :='';

  if not qryTipoContrato.Active then exit;


  if cboTipoContrato.Text <> '' then begin
    sTipoContrato := cboTipoContrato.keyValue;
  end else begin
    qryTipoContrato.First;

    while not qryTipoContrato.Eof do begin
      sTipoContrato := sTipoContrato +','+ qryTipoContrato.FieldByname('IDTIPOCONTREMPTMO').asString;
      qryTipoContrato.Next;
    end;
    sTipoContrato := Copy(sTipoContrato,2,length(sTipoContrato));
  end;

  sData     := QuotedStr(edtDataQuitacaoArquivo.Text);
  sPeriodo1 := QuotedStr(edtPeriodo1.Text);
  sPeriodo2 := QuotedStr(edtPeriodo2.Text);

  sSQL := 'SELECT ''1'' AS FLGENVIA, ppc.nome AS PLANOCONTABIL, C.IDCONTRATOEMPTMO AS NUMCONTRATO,D.MATRICULA,P.NUMDOCUMENTO AS CPF,P.NOME, '+
          ' '+SDATA+' AS DATAQUITACAO, HST.HMEDATAPREVISTA AS DATACONTRATACAO, '+

       ' (SELECT H.HMESALDODEV '+
       ' FROM HISTMOVEMPTMO H, CONTRATOEMPTMO C1, ITEMXTIPOCONTR ITC '+
       ' WHERE H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO '+
       ' AND   H.IDCONTRATOEMPTMO = C1.IDCONTRATOEMPTMO '+
       ' AND   C1.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO '+
       ' AND   ITC.IDITEMEMPTMO = H.IDITEMEMPTMO '+
       ' AND   NVL(H.FLGESTORNADO,0) = 0 '+
       ' AND   H.HMEDATAPREVISTA = TO_DATE('+SDATA+',''DD/MM/YYYY'')'+
       ' AND   ITC.ITCORDEMEXTRATO = (SELECT MAX(I.ITCORDEMEXTRATO) '+
       '                              FROM ITEMXTIPOCONTR I '+
       '                              WHERE I.IDITEMEMPTMO IN (SELECT IDITEMEMPTMO '+
       '                                                       FROM HISTMOVEMPTMO HME '+
       '                                                       WHERE HME.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO  '+
       '                                                       AND   HME.HMEDATAPREVISTA = TO_DATE('+SDATA+',''DD/MM/YYYY'') '+
       '                                                       AND   NVL(HME.FLGESTORNADO,0) = 0) '+
       '                             ) '+
       ' ) AS SALDODEVEDOR,    '+

       '      (SELECT H1.HMEVLRPREVISTO                              '+
       '         FROM HISTMOVEMPTMO H1                               '+
       '        WHERE H1.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO       '+
       '          AND H1.IDITEMEMPTMO = ''22''                       '+
       '          AND NVL(HMECENTRALIZA,0)=0                                   '+
       '          AND H1.HMEDATAPREVISTA =  HST.HMEDATAPREVISTA) AS VALORBRUTO '+


       ' FROM CONTRATOEMPTMO C, PESSOA P, DEPENTIT D, HISTMOVEMPTMO    HST, Planprevcontabil ppc '+
       ' WHERE C.FLGSITUACAO IN (''A'',''E'') '+
       '  AND   C.IDTIPOCONTREMPTMO IN ('+STIPOCONTRATO+') '+
       '  AND c.idplanoorigem = ppc.idplanoprev ' +
       '  AND   C.IDBENEF = P.IDPESSOA  '+
       '  AND   C.IDBENEF = D.IDPESSOA  '+
       '  AND   C.IDPESSOA = D.IDTITULAR '+


       '  AND HST.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO '+
       '  AND HST.HMECENTRALIZA = 1                     '+

       ' AND hst.hmeorigem = 0  '+
       ' AND hst.hmetipomov = 0  '+
       ' AND hst.iditememptmo = 6  '+

       '  AND ((HST.HMEDATAPREVISTA >= TO_DATE('+SPERIODO1+', ''DD/MM/YYYY'')) '+
       '  AND (HST.HMEDATAPREVISTA <= TO_DATE('+SPERIODO2+', ''DD/MM/YYYY''))) '+

       '  ORDER BY NUMCONTRATO,NOME ';



    qryGeraArquivo.Close;
    qryGeraArquivo.SQL.Clear;
    qryGeraArquivo.SQL.Add(sSQL);
    qryGeraArquivo.Open;

    if qryGeraArquivo.isEmpty then begin
      Messagebox (Handle,'Não foram encontrados contratos para os critérios selecionados.','Empréstimo', mb_Iconinformation + mb_Ok);
      lblQntContratos.Caption      :='';
      lblValorTotalArquivo.Caption :='';

      qryGeraArquivo.Close;
      Exit;
    end;

    lblQntContratos.Caption := intTostr(qryGeraArquivo.RecordCount);


    qryGeraArquivo.DisableControls;
    qryGeraArquivo.First;

    fValorTotalArquivo := 0 ;
    While Not qryGeraArquivo.Eof do begin
      fValorTotalArquivo := fValorTotalArquivo + qryGeraArquivo.FieldByname('SALDODEVEDOR').asFloat;
      qryGeraArquivo.Next;
    end;

    lblValorTotalArquivo.caption := FloatTostr(fValorTotalArquivo);

    qryGeraArquivo.First;
    qryGeraArquivo.EnableControls;


end;

procedure TfrmQuitacaoLote.SpeedButton2Click(Sender: TObject);
begin
  inherited;

  if (ProcuraDirDlg1.Execute)then begin
    edtDestinoArquivo.Text := UpperCase(ProcuraDirDlg1.Directory);
  end;

end;

procedure TfrmQuitacaoLote.SpeedButton1Click(Sender: TObject);
var F                  : TextFile;
    FAtualizacaoDiaria : TextFile;
    sPath   : string;
    sLinha  : String;
    sCampos : String;
    i       : Integer;
    bTemAtualizacaoDiaria : Boolean;
begin
  inherited;


  bTemAtualizacaoDiaria := True;


  if edtDataQuitacaoArquivo.Date <= 0 then begin
    messagebox (Handle,'Preencha a Data de Quitação!','Empréstimo', mb_Iconinformation + mb_Ok);
    Exit;
  end else begin
    if (edtDataQuitacaoArquivo.Date > ((Now)+20)) then begin //Renato Visoni SOL 126452 Kintana 660511
      messagebox (Handle,'Não é possível gerar arquivo para período superior a vinte dias contados a partir da data atual.','Empréstimo', mb_Iconinformation + mb_Ok);
      Exit;
    end;
  end;

  if qryGeraArquivo.Active then begin
    qryGeraArquivo.First;
    if (edtDataQuitacaoArquivo.Date <> qryGeraArquivo.FieldByName('DATAQUITACAO').AsDateTime) then begin
      if MsgDlg('A data de quitação foi alterada! Deseja refazer a busca?','Empréstimo', mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
        btnBusca.Click;
        Exit;
      end else begin
        edtDataQuitacaoArquivo.Date := qryGeraArquivo.FieldByName('DATAQUITACAO').AsDateTime;
      end;
    end;
  end;

  if edtDestinoArquivo.Text = '' then begin
    messagebox (Handle,'Escolha o destino do Arquivo!','Empréstimo', mb_Iconinformation + mb_Ok) ;
    exit;
  end else begin
    sPath := edtDestinoArquivo.Text+'\Quitação em Lote'+Copy(edtDataQuitacaoArquivo.Text,7,4)+Copy(edtDataQuitacaoArquivo.Text,4,2)+Copy(edtDataQuitacaoArquivo.Text,1,2)+'.txt' ;
  end;



  sLinha  := '';
  sCampos := '';
  i       := 0;

  if qryGeraArquivo.Active then begin

    qryGeraArquivo.First;

    AssignFile(F, sPath);
    ReWrite(F);


    frmProgresso.MostraFormProgresso('Gerando Arquivo...',
                                      True,
                                      True,
                                      True,
                                         0,
                                      strToint(lblQntContratos.Caption)
                                    );



    qryGeraArquivo.DisableControls;
    WriteLn(F, 'Número Contrato;Matrícula;Nome;CPF;Saldo Devedor; Data da Quitação; Data da Contratação; Valor Bruto; Plano Contábil');
    While Not qryGeraArquivo.Eof do begin
      if qryGeraArquivo.FieldByname('FLGENVIA').asInteger = 1 Then Begin

        //if not(CalcEmptmo.PossuiAtualizacaoDiaria(qryGeraArquivo.FieldByname('NUMCONTRATO').asFloat, qryGeraArquivo.FieldByname('DATAQUITACAO').asDateTime)) then begin
        if qryGeraArquivo.FieldByname('SALDODEVEDOR').asFloat = 0 then begin
          if bTemAtualizacaoDiaria = True then begin
            AssignFile(FAtualizacaoDiaria, edtDestinoArquivo.Text+'\AtualizacaoDiaria'+Copy(edtDataQuitacaoArquivo.Text,7,4)+Copy(edtDataQuitacaoArquivo.Text,4,2)+Copy(edtDataQuitacaoArquivo.Text,1,2)+'.txt');
            ReWrite(FAtualizacaoDiaria);
          end;

          WriteLn(FAtualizacaoDiaria, qryGeraArquivo.FieldByname('NUMCONTRATO').asString);
          bTemAtualizacaoDiaria := False;

          inc(i);
          frmProgresso.AndaFormProgresso(i);

        end else begin
          sCampos := qryGeraArquivo.FieldByname('NUMCONTRATO').asString +';'+qryGeraArquivo.FieldByname('MATRICULA').asString +';'+
                     qryGeraArquivo.FieldByname('NOME').asString +';'+ qryGeraArquivo.FieldByname('CPF').asString +';'+
                     qryGeraArquivo.FieldByname('SALDODEVEDOR').asString +';'+ qryGeraArquivo.FieldByname('DATAQUITACAO').asString +';'+
                     qryGeraArquivo.FieldByname('DATACONTRATACAO').asString +';'+ qryGeraArquivo.FieldByname('VALORBRUTO').asString+';'+
                     qryGeraArquivo.FieldByname('PLANOCONTABIL').asString ;

          sLinha := sLinha + sCampos;

          WriteLn(F, sLinha);

          inc(i);
          frmProgresso.AndaFormProgresso(i);

          if frmProgresso.Cancelou then begin
            if bTemAtualizacaoDiaria = False then begin;
              CloseFile(FAtualizacaoDiaria);
            end;
            CloseFile(F);
            qryGeraArquivo.EnableControls;
            Exit;
          end;
        end;
      end;
      qryGeraArquivo.Next;

      sLinha  := '';
      sCampos := '';

    end;

    qryGeraArquivo.First;
    qryGeraArquivo.EnableControls;
    frmProgresso.EscondeFormProgresso;
    CloseFile(F);


    if bTemAtualizacaoDiaria = False then begin
      CloseFile(FAtualizacaoDiaria);
      messagebox (Handle,pChar('Existem contratos sem atualização diária para a Data Informada!'+#10+'Foi gerado um arquivo extra em : '+ edtDestinoArquivo.Text+'\AtualizacaoDiaria'+Copy(edtDataQuitacaoArquivo.Text,7,4)+Copy(edtDataQuitacaoArquivo.Text,4,2)+Copy(edtDataQuitacaoArquivo.Text,1,2)+'.txt'),'Empréstimo', mb_Iconinformation + mb_Ok);
    end;
  end;
  
end;

procedure TfrmQuitacaoLote.BitBtn2Click(Sender: TObject);
var sSQL : string;
fValorCancelado : Currency;
begin
  inherited;

  lblNcontratoCanc.Caption := '';
  fValorCancelado := 0;

  if edtDataQuitacaoArquivo.Date <= 0 then begin
    messagebox (Handle,'Preencha a Data de Quitação.','Empréstimo', mb_Iconinformation + mb_Ok);
    exit;
  end;

   sSQL := ' SELECT HST.IDCONTRATOEMPTMO, P.NOME, HST.FLGENVIO '+
   ' FROM HISTMOVEMPTMO HST, CONTRATOEMPTMO C, PESSOA P '+
   '  WHERE HST.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO '+
   '    AND C.IDBENEF = P.IDPESSOA '+
   '    AND HMETIPOMOV = 3 '+
   '    AND hst.iditememptmo = 17 '+
   '    AND HST.HMEDATAPREVISTA = '+QuotedStr(trim(edtDataCancelamento.Text))+
   '    AND HST.FLGRECEBIMENTO IS NULL '+
   '    AND NVL(HST.FLGESTORNADO, 0) <> 1 '+
   '    AND C.IDTIPOCONTREMPTMO IN (22, 23, 24, 25) '+
   '    AND HST.HMEDATAEFETIVA IS NULL '+
   '    AND HST.HMEVLREFETIVO IS NULL '+
   '    AND HST.FLGBAIXADO = 0 '
   ;



   QryContratosCanc.Close;
   QryContratosCanc.SQL.Clear;
   QryContratosCanc.SQL.Add(sSQL);
   QryContratosCanc.Open;

   lblNcontratoCanc.Caption := intTostr(QryContratosCanc.RecordCount);
 
end;

procedure TfrmQuitacaoLote.BitBtn3Click(Sender: TObject);
begin
  inherited;

  cboTipoContrato.KeyValue := -1;

end;

procedure TfrmQuitacaoLote.edtDataQuitacaoArquivoCloseUp(Sender: TObject);
begin
  inherited;

  if (edtDataQuitacaoArquivo.Date > ((Now)+20)) then begin //Renato Visoni SOL 126452 Kintana 660511
      messagebox (Handle,'Não é possível gerar arquivo para período superior a vinte dias contados a partir da data atual.','Empréstimo', mb_Iconinformation + mb_Ok);
      edtDataQuitacaoArquivo.SetFocus;
  end;

end;

procedure TfrmQuitacaoLote.bbtnConfirmarClick(Sender: TObject);
var i : integer;
begin
  inherited;


  if edtArquivo.Text = '' then exit;



  if (not(QryQuitacaoLote.Active)) or (QryQuitacaoLote.IsEmpty) then exit;

  frmProgresso.MostraFormProgresso('Gerando Quitação em Lote...',
                                      True,
                                      True,
                                      True,
                                         0,
                                      strToint(lblnContratosQuitacao.Caption)
                                    );


  QryQuitacaoLote.DisableControls;

  if not(dtmBaseDados.dbBaseDados.InTransaction)
  then
    dtmBaseDados.dbBaseDados.StartTransaction;


  edtDataQuitacaoArquivo.Date := Now;
  AssignFile(fDemonstrativo, GetCurrentDir+'\ResultadoQuitação'+Copy(edtDataQuitacaoArquivo.Text,7,4)+Copy(edtDataQuitacaoArquivo.Text,4,2)+Copy(edtDataQuitacaoArquivo.Text,1,2)+'.txt');
  ReWrite(fDemonstrativo);


  try
    i := 0;
    While Not QryQuitacaoLote.Eof do begin

      InsertHistmovemptmo(17);

      InsertHistmovemptmo(35);


      QryAux.CLose;
      QryAux.SQL.Clear;
      QryAux.SQL.Add(' UPDATE CONTRATOEMPTMO SET FLGSITUACAO = ''K'',DATASITUACAO='+QuotedStr(QryQuitacaoLote.FieldByname('DATAQUITACAO').asString));
      QryAux.SQL.Add(' WHERE IDCONTRATOEMPTMO =' + QryQuitacaoLote.FieldByname('NUMCONTRATO').asString);
      QryAux.ExecSQL;

      QryAux.CLose;
      QryAux.SQL.Clear;
      QryAux.SQL.Add(' UPDATE HISTMOVEMPTMO SET FLGESTORNADO = 1, HMEDATAESTORNO ='+ QuotedStr(QryQuitacaoLote.FieldByname('DATAQUITACAO').asString));
      QryAux.SQL.Add(' WHERE IDCONTRATOEMPTMO =' + QryQuitacaoLote.FieldByname('NUMCONTRATO').asString  );
      QryAux.SQL.Add(' AND HMEDATAPREVISTA >'+ QuotedStr(QryQuitacaoLote.FieldByname('DATAQUITACAO').asString)      );
      QryAux.ExecSQL;

      WriteLn(fDemonstrativo,QryQuitacaoLote.FieldByname('NUMCONTRATO').asString+' -   '+QryQuitacaoLote.FieldByname('SALDODEVEDOR').asString );

      inc(i);

      frmProgresso.AndaFormProgresso(i);

      if frmProgresso.Cancelou then begin
        if dtmBaseDados.dbBaseDados.InTransaction
          then dtmBaseDados.dbBaseDados.RollBack;

        CloseFile(fDemonstrativo);
        QryQuitacaoLote.EnableControls;
        Exit;
      end;


      QryQuitacaoLote.Next;
    end;
    QryQuitacaoLote.First;
    QryQuitacaoLote.EnableControls;
    frmProgresso.EscondeFormProgresso;

    edtDataQuitacaoArquivo.Date := Now;

    messagebox (Handle,pChar('Quitação concluída com sucesso. Foi gerado arquivo com o resultado do processo em :'+#13+ GetCurrentDir+'\ResultadoQuitação'+Copy(edtDataQuitacaoArquivo.Text,7,4)+Copy(edtDataQuitacaoArquivo.Text,4,2)+Copy(edtDataQuitacaoArquivo.Text,1,2)+'.txt'),'Empréstimo', mb_Iconinformation + mb_Ok);


    if MsgDlg('Deseja salvar a Quitação?','Empréstimo', mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

      QryQuitacaoLote.Close;
      QryQuitacaoLote.Open;

    end else begin
      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
    end;

  except

    frmProgresso.EscondeFormProgresso;

    MsgDlg('Erro ao Processar arquivo.','Empréstimo', mtConfirmation,[mbOK],0);

    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;

  end;


  CloseFile(fDemonstrativo);

end;

procedure TfrmQuitacaoLote.InsertHistmovemptmo(idItemEmptmo : Integer);
begin

  QryAux.CLose;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' SELECT FLGSITUACAO,IDPATRO,IDPLANOORIGEM,TXJUROS FROM CONTRATOEMPTMO ');
  QryAux.SQL.Add(' WHERE IDCONTRATOEMPTMO =' + QryQuitacaoLote.FieldByname('NUMCONTRATO').asString);
  QryAux.Open;

  if QryAux.FieldByname('FLGSITUACAO').asString = 'K' then exit;


  QryInsert.Close;

  QryInsert.ParamByname('pIDCONTRATOEMPTMO').asString  := QryQuitacaoLote.FieldByname('NUMCONTRATO').asString;
  QryInsert.ParamByname('pIDITEMCENTRALIZA').asString  := '17';
  QryInsert.ParamByname('pIDITEMEMPTMO').asInteger     := idItemEmptmo;
  QryInsert.ParamByname('pHMEPARCELA').asString        := '0';
  QryInsert.ParamByname('pHMETIPOMOV').asString        := '3';
  QryInsert.ParamByname('pHMEORIGEM').asString         := '15';
  QryInsert.ParamByname('pHMEFORMACOBRANCA').asString  := 'C';
  QryInsert.ParamByname('pHMESEQCOBRANCA').asString    := '1';
  QryInsert.ParamByname('pHMEPRIORIDADE').asString     := '1';

  if idItemEmptmo = 17 then begin
    QryInsert.ParamByname('pHMECENTRALIZA').asString   := '1';
  end else begin
    QryInsert.ParamByname('pHMECENTRALIZA').asString   := '0';
  end;

  QryInsert.ParamByname('pHMEDESTACADO').asString      := '0';
  QryInsert.ParamByname('pHMEDATA').asString           := QryQuitacaoLote.FieldByname('DATAQUITACAO').asString;


  QryInsert.ParamByname('pHMEDATAPREVISTA').asString   := QryQuitacaoLote.FieldByname('DATAQUITACAO').asString;
  QryInsert.ParamByname('pHMEDATAATUALIZA').asString   := QryQuitacaoLote.FieldByname('DATAQUITACAO').asString;
  QryInsert.ParamByname('pHMEDATAVENCTO').asString     := QryQuitacaoLote.FieldByname('DATAQUITACAO').asString;
  QryInsert.ParamByname('pHMEANOCOMPETENCIA').asString := Copy(QryQuitacaoLote.FieldByname('DATAQUITACAO').asString,7,4);
  QryInsert.ParamByname('pHMEMESCOMPETENCIA').asString := Copy(QryQuitacaoLote.FieldByname('DATAQUITACAO').asString,4,2);
  QryInsert.ParamByname('pHMEANOCOBRANCA').asString    := Copy(QryQuitacaoLote.FieldByname('DATAQUITACAO').asString,7,4);
  QryInsert.ParamByname('pHMEMESCOBRANCA').asString    := Copy(QryQuitacaoLote.FieldByname('DATAQUITACAO').asString,4,2);

  QryInsert.ParamByname('pFLGENVIO').asString        := '0';

  QryInsert.ParamByname('pHMEDATAVENCTO').asString     := QryQuitacaoLote.FieldByname('DATAQUITACAO').asString;
  QryInsert.ParamByname('pIDMODULO').asString          := '15';
  QryInsert.ParamByname('pVERSAO').asString          :=  sistema.Versao;

  QryInsert.ParamByname('pFLGBAIXADO').asString      := '0';
 
  QryInsert.ParamByname('pHMERECPAG').asString         := 'R';
  QryInsert.ParamByname('pHMENUMPARCELAS').asString    := '0';

  QryInsert.ParamByname('pHMEVLRPREVISTO').asString    := QryQuitacaoLote.FieldByname('SALDODEVEDOR').asString;


  QryInsert.ParamByname('pHMESALDODEV').asString       := '0';


  QryInsert.ParamByname('pHMETXJUROS').asString        := QryAux.FieldByname('TXJUROS').asstring;
  QryInsert.ParamByname('pHMEOBSERVACAO').asString     := 'Quitação realizada por Quitação em Lote';
  QryInsert.ParamByname('pIDPLANOPREVCONTAB').asString := QryAux.FieldByname('IDPLANOORIGEM').asstring;
  QryInsert.ParamByname('pIDPATRO').asString           := QryAux.FieldByname('IDPATRO').asstring;

  QryInsert.ExecSQL;


end;

procedure TfrmQuitacaoLote.FormCreate(Sender: TObject);
begin
  inherited;

  PageCOntrol.ActivePage := pgGerarArquivo;

  edtDataQuitacaoArquivo.Date := Now;
  edtPeriodo1.Date            := Now;
  edtPeriodo2.Date            := Now;

end;

procedure TfrmQuitacaoLote.Button1Click(Sender: TObject);
var sSQL : string;
begin
  inherited;

  if edtDataQuitacaoArquivo.Date <= 0 then begin
    messagebox (Handle,'Preencha a Data de Quitação.','Empréstimo', mb_Iconinformation + mb_Ok);
    exit;
  end;


   sSQL := ' SELECT  DISTINCT HST.IDCONTRATOEMPTMO, P.NOME FROM HISTMOVEMPTMO HST ,CONTRATOEMPTMO C, PESSOA P  '+
   ' WHERE HST.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO             '+
   ' AND C.IDPESSOA = P.IDPESSOA                                 '+
   ' AND HMETIPOMOV       = 3                                    '+
   ' AND HST.HMEDATAPREVISTA  ='+QuotedStr(trim(edtDataCancelamento.Text))+
   ' AND HST.FLGRECEBIMENTO   IS NULL                            '+
   ' AND C.IDTIPOCONTREMPTMO IN (22,23,24,25)                        '+
   ' AND (                                                       '+
   '        (                                                    '+
   '            HST.HMEDATAEFETIVA   IS NULL                     '+
   '        AND HST.HMEVLREFETIVO    IS NULL                     '+
   '        AND HST.FLGBAIXADO       = 0                         '+
   '        )                                                    '+
   '     OR HST.HMEVLREFETIVO    = 0                             '+
   '    )                                                        ';


   QryContratosCanc.Close;
   QryContratosCanc.SQL.Clear;
   QryContratosCanc.SQL.Add(sSQL);
   QryContratosCanc.Open;

   lblNcontratoCanc.Caption := intTostr(QryContratosCanc.RecordCount);

end;

procedure TfrmQuitacaoLote.BitBtn1Click(Sender: TObject);
var listContratos : TStringList;
i : Integer;
sSQL : String;
scontratos : String;

begin
  inherited;

  memResult.Clear;
  listContratos := TStringList.Create;

  if not QryContratosCanc.Active then exit;
  if  QryContratosCanc.isEmpty then exit;


  i := 0;

  if MsgDlg('O processo de cancelamento de quitação não pode ser desfeito.' +#10+ 'Deseja Continuar?','Empréstimo', mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;



  MostraEspera('Cancelando Quitação em Lote...');
  QryContratosCanc.DisableControls;

  QryContratosCanc.First;
  While not QryContratosCanc.Eof do begin
    if QryContratosCanc.FieldByname('FlgEnvio').asString = '0' then begin
      if i=0 then begin
        sContratos := QuotedStr(QryContratosCanc.FieldByname('IDCONTRATOEMPTMO').asString);
      end else begin
        sContratos :=  sContratos + ','+ QuotedStr(QryContratosCanc.FieldByname('IDCONTRATOEMPTMO').asString)  ;
      end;

      if (i = 500) then begin
        if Copy(sContratos,1,1)=',' then sContratos := Copy(sContratos,2,length(sContratos));

        listContratos.Add(sContratos);
        i:=0;
        sContratos :='';
      end;
    end else begin
      memResult.Lines.Add(QryContratosCanc.FieldByname('IDCONTRATOEMPTMO').asString);
    end;
    inc(i);
    QryContratosCanc.Next;
  end;

  if Copy(sContratos,1,1)=',' then sContratos := Copy(sContratos,2,length(sContratos));
  listContratos.Add(sContratos);



  if not(dtmBaseDados.dbBaseDados.InTransaction)
  then
    dtmBaseDados.dbBaseDados.StartTransaction;

  try
    sSQL := '';
    sSQL := ' UPDATE                                      '+
            ' HISTMOVEMPTMO                               '+
            ' SET                                         '+
            '  FLGESTORNADO         = 1,                  '+
            '  HMEDATAESTORNO       = HMEDATAPREVISTA,    '+
            '  HMEDATAESTORNOALT    = (SELECT SYSDATE FROM DUAL), '+
            '  IDUSUARIOESTORNO     ='+ intToStr(Sistema.IdUsuario)   +
            ' WHERE                                       '+
            '      HMETIPOMOV       = 3                   '+
            '  AND HMEDATAPREVISTA  ='+QuotedStr(trim(edtDataCancelamento.Text))+
            '  AND FLGRECEBIMENTO   IS NULL '+
            '  AND (                        '+
            '          (                    '+
            '              HMEDATAEFETIVA   IS NULL '+
            '          AND HMEVLREFETIVO    IS NULL '+
            '          AND FLGBAIXADO       = 0     '+
            '          )                            '+
            '       OR HMEVLREFETIVO    = 0         '+
            '      )                                '+
            ' AND (IDCONTRATOEMPTMO IN (';

    for i := 0 to listContratos.count-1 do begin
      if i=0 then begin
        sSQL := sSQL + listContratos[i]+')';
      end else begin
        sSQL := sSQL +  'OR (IDCONTRATOEMPTMO IN('+listContratos[i]+'))';
      end;
    end;

    sSQL := sSQL + ')';

    QryAux.CLose;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;



    sSQL :='';

    sSQL := ' UPDATE CONTRATOEMPTMO SET FLGSITUACAO = ''A'''+
              ' WHERE (IDCONTRATOEMPTMO IN (';

    for i := 0 to listContratos.count-1 do begin
      if i=0 then begin
        sSQL := sSQL + listContratos[i]+')';
      end else begin
        sSQL := sSQL +  'OR (IDCONTRATOEMPTMO IN('+listContratos[i]+'))';
      end;
    end;
    sSQL := sSQL + ')';

    QryAux.CLose;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSQL);
    QryAux.ExecSQL;
    EscondeEspera;


    MostraEspera('Cancelando Quitação em Lote...');


    QryContratosCanc.First;
    While not QryContratosCanc.Eof do begin
      if QryContratosCanc.FieldByname('FlgEnvio').asString = '0' then begin
        dtmAtualizacaoDiaria.ExecutaAtuDia(QryContratosCanc.FieldByname('IDCONTRATOEMPTMO').asFloat,        // Contrato
                                            Sistema.IDModulo,
                                            -1,                      // Tipo Contr
                                            -1,                      // Tipo Emptmo
                                            -1,                      // Patro
                                            -1,                      // Plano
                                            1,                       // Estorno
                                            0,                       // Prov Perda
                                            1,                       // Atu Saldo
                                            -1,                      // In Arquivo
                                            -1,                      // Not In Arquivo
                                            edtDataCancelamento.Date,           // Data Ini
                                            edtDataCancelamento.Date + 10,      // Data Fim
                                            edtDataCancelamento.Date - 1        // Data Considera
                                           );



      end;
      QryContratosCanc.Next;
    end;
    EscondeEspera;

  except
    MsgDlg('Erro ao Cancelar Quitação.','Empréstimo', mtConfirmation,[mbOk],0);
    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;

  end;

  QryContratosCanc.EnableControls;

  if dtmBaseDados.dbBaseDados.InTransaction
    then dtmBaseDados.dbBaseDados.Commit;

  QryContratosCanc.Close;
  QryContratosCanc.Open;

  if memResult.Lines.Count > 0 then begin
    MsgDlg('Alguns contratos já foram Enviados e não serão cancelados.','Empréstimo', mtConfirmation,[mbOk],0);
    pgContratos.ActivePage := tb2;
  end;


end;

procedure TfrmQuitacaoLote.gridGeracaoDblClick(Sender: TObject);
begin
  inherited;

  if (not qryGeraArquivo.Active) or (gridGeracao.GetActiveCol <> 1) then Exit;
  
  if qryGeraArquivo.FieldByname('flgEnvia').asString = '1' then begin
    lblQntContratos.Caption      := intTostr((strToint(lblQntContratos.Caption)-1));
    lblValorTotalArquivo.Caption := FloatTostr(strTofloat(lblValorTotalArquivo.Caption) - QryGeraArquivo.Fieldbyname('SALDODEVEDOR').asCurrency);
  end else begin
    lblQntContratos.Caption := intTostr((strToint(lblQntContratos.Caption)+1));
    lblValorTotalArquivo.Caption := FloatTostr(strTofloat(lblValorTotalArquivo.Caption) + QryGeraArquivo.Fieldbyname('SALDODEVEDOR').asCurrency);
  end;

end;

procedure TfrmQuitacaoLote.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if qryGeraArquivo.Active then begin
    qryGeraArquivo.First;

    qryGeraArquivo.DisableControls;

    While not qryGeraArquivo.Eof do begin
      qryGeraArquivo.Edit;
      if qryGeraArquivo.FieldByname('flgEnvia').asInteger = 1 then begin
        qryGeraArquivo.FieldByname('flgEnvia').asInteger := 0;
        lblQntContratos.Caption := intTostr((strToint(lblQntContratos.Caption)-1));
        lblValorTotalArquivo.Caption := FloatTostr(strTofloat(lblValorTotalArquivo.Caption) - QryGeraArquivo.Fieldbyname('SALDODEVEDOR').asCurrency);
      end else begin
        qryGeraArquivo.FieldByname('flgEnvia').asInteger := 1;
        lblQntContratos.Caption := intTostr((strToint(lblQntContratos.Caption)+1));
        lblValorTotalArquivo.Caption := FloatTostr(strTofloat(lblValorTotalArquivo.Caption) + QryGeraArquivo.Fieldbyname('SALDODEVEDOR').asCurrency);
      end;
      qryGeraArquivo.Post;
      qryGeraArquivo.Next;
    end;

    qryGeraArquivo.First;
    qryGeraArquivo.EnableControls;

  end;

end;

procedure TfrmQuitacaoLote.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if qryGeraArquivo.Active then begin
    qryGeraArquivo.First;
    qryGeraArquivo.DisableControls;
    While not qryGeraArquivo.Eof do begin
      qryGeraArquivo.Edit;
        qryGeraArquivo.FieldByname('flgEnvia').asINteger := 1;
      qryGeraArquivo.Post;
      qryGeraArquivo.Next;
    end;
    qryGeraArquivo.First;
    qryGeraArquivo.EnableControls;

    lblQntContratos.Caption := intTostr(qryGeraArquivo.RecordCount);
    lblValorTotalArquivo.Caption := FloatToStr(fValorTotalArquivo);
  end;



end;

procedure TfrmQuitacaoLote.BitBtn4Click(Sender: TObject);
begin
  inherited;
  edtDestinoArquivo.Text :='';
end;

procedure TfrmQuitacaoLote.BitBtn7Click(Sender: TObject);
begin
  inherited;

  edtArquivo.Text :='';

  QryQuitacaoLote.Close;
  QryQuitacaoLote.Open;

end;

procedure TfrmQuitacaoLote.PageControlChange(Sender: TObject);
begin
  inherited;
  pgContratos.ActivePage := tb1;
end;

end.
procedure TfrmQuitacaoLote.btnBuscaContratoClick(Sender: TObject);
begin
  inherited;

end;


