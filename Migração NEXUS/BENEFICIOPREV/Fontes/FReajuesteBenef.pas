unit FReajuesteBenef;

//******************************************************************************************
//Rotina: Apenas no DFM
//Nº SIG: 88959
//Data da Alteração: 15/07/2019
//Responsável: Fabio Sampaio
//Descrição: Alteração da Flag Active para False do componente connTB.
//******************************************************************************************
//Rotina: Reajuste de benefícios
//Nº SIG: 80018
//Data da Alteração: 21/12/2018
//Responsável: Osni Cavalcante
//Descrição: Correção e melhoria na performance da rotina que carrega a lista de matrículas 
//           para o reajuste dos benefícios.
//******************************************************************************************
//Rotina: -
//Nº SOL: 225546/15827
//Nº KINTANA: 2061170
//Data da Alteração: 07/03/2014
//Alteração Form: Mudança na SQL dos benefícios
//Responsável: Felipe A. Santos
//Descrição: foi retirado o filtro do IDPLANPREVCONTAB pois segundo o caso de teste este foi
//           inserido incorretamente.
//**************************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, Grids, DBGrids, DBGrid2,
  wwdbdatetimepicker, CheckLst, Db, DBTables, Wwquery, Wwdatsrc, DBClient,
  wwclient, Provider, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, MontaSelect,
  DBCtrls, TREdit, fFrameLista, Wwqbe,usistema,UMensErro, Wwtable, ADODB;

const
   sSQLList =' SELECT MAX(IDLISTABENEFICIOREAJUSTE) AS IDLISTABENEF FROM LISTABENEFICIOREAJUSTE ';
   sSQLProcesso =  'SELECT TOTALBENEFICIOS,TOTALBENEFREAJ, TOTALBENEFREJ FROM REAJUSTEBENEFICIO WHERE IDREAJUSTEBENEFICIO = :PIDREAJUSTEBENEFICIO';
   sSQLInsert = (' INSERT INTO cm.REAJUSTEBENEFICIO	                '+
                '  (IDREAJUSTEBENEFICIO,			        '+
                '   IDPLANOPREV,					'+
                '   IDLISTA,						'+
                '   FLGAPATUALIZABENEF,				        '+
                '   ANOMESINIINDICE,				        '+
                '   ANOMESFIMINDICE,				        '+
                '   ANOMESINICALC,					'+
                '   ANOMESFIMCALC,					'+
                '   ANOMESINIACERTO,				        '+
                '   ANOMESFIMACERTO,				        '+
                '   ANOMESCOMPREEM,					'+
                '   FLGAPPERCFRB,					'+
                '   PERCFRB,						'+
                '   FONTEPAGADORA,					'+
                '   FLGATIVO,						'+
                '   FLGRETIDO,						'+
                '   FLGENCERRADO,					'+
                '   IDLOTE,						'+
                '   IDMOTIVO,						'+
                '   FLGALTERADORES,					'+
                '   FLGREAJUSTETOTAL,                                    '+
                '   OBSERVACAO,						'+
                '   TRGDTINCLUSAO,					'+
                '   TRGUSERINCLUSAO)				        '+
                ' VALUES(						'+
                '   :IDREAJUSTEBENEFICIO,			        '+
                '   :IDPLANOPREV,					'+
                '   :IDLISTA,						'+
                '   :FLGAPATUALIZABENEF,			        '+
                '   :ANOMESINIINDICE,				        '+
                '   :ANOMESFIMINDICE,				        '+
                '   :ANOMESINICALC,					'+
                '   :ANOMESFIMCALC,					'+
                '   :ANOMESINIACERTO,				        '+
                '   :ANOMESFIMACERTO,				        '+
                '   :ANOMESCOMPREEM,				        '+
                '   :FLGAPPERCFRB,					'+
                '   TO_NUMBER(:PERCFRB),			        '+
                '  :FONTEPAGADORA,					'+
                '   :FLGATIVO,						'+
                '   :FLGRETIDO,						'+
                '   :FLGENCERRADO,					'+
                '   :IDLOTE,						'+
                '   :IDMOTIVO,						'+
                '   :FLGALTERADORES,				        '+
                '   :FLGREAJUSTETOTAL,                                    '+
                '   :OBSERVACAO,					'+
                '   :TRGDTINCLUSAO,					'+
                '   :TRGUSERINCLUSAO)				        ');


sSQLBenef  = ('SELECT DISTINCT B.IDBENEFICIO, B.NOME, BPP.IDPLANPREVCONTAB, BPP.FLGREFERENCIA '+
              '  FROM BENEFICIO B                                                        '+
              '     JOIN BENEFPLANPREV BPP ON B.IDBENEFICIO = BPP.IDBENEFICIO            '+
              ' WHERE B.IDTPPAGTOBENEFIC = 1 AND      '+  //--BENEFÍCIOS DE PAGAMENTO VITALÍCIO
              '      NVL(B.FLGRESGATE,0) = 0 AND     '+   //--BENEFÍCIOS QUE NÃO SÃO DE RESGATE
              //'      NVL(BPP.IDPLANPREVCONTAB,1) <> 2 AND  '+ //--RETIRADA DOS BENEFÍCIOS REPLAN NÃO SALDADO // Felipe A. Santos SOL 225546/15827 KTN 2061170 Comentado
              '      BPP.IDPLANOPREV = :IDPLANOPREV AND                               '+
              //'      BPP.IDPLANOPREV NOT IN (255,358) AND                               '+  // Felipe A. Santos SOL 225546/15827 KTN 2061170 Comentado
              '      BPP.IDBENEFICIO NOT IN (255,358) AND                               '+  // Felipe A. Santos SOL 225546/15827 KTN 2061170
              '      BPP.FLGREFERENCIA = :FONTEPAGADORA   '+ //-- 0 PARA FONTE PAGADORA FUNCEF
              ' ORDER BY B.NOME');     //-- 1 PARA FONTE PAGADORA INSS


sSQLTodosBenef = ('SELECT DISTINCT B.IDBENEFICIO, B.NOME, BPP.IDPLANPREVCONTAB, BPP.FLGREFERENCIA '+
                  '  FROM BENEFICIO B                                                        '+
                  '     JOIN BENEFPLANPREV BPP ON B.IDBENEFICIO = BPP.IDBENEFICIO            '+
                  ' WHERE B.IDTPPAGTOBENEFIC = 1 AND     '+ // --BENEFÍCIOS DE PAGAMENTO VITALÍCIO
                  '      NVL(B.FLGRESGATE,0) = 0 AND     '+//--BENEFÍCIOS QUE NÃO SÃO DE RESGATE
                  '      BPP.IDPLANOPREV NOT IN (255,358) AND                               '+
                  '      BPP.IDPLANOPREV IN (2,66,74) AND                               '+
                  '      BPP.FLGREFERENCIA = :FONTEPAGADORA   '+ //-- 0 PARA FONTE PAGADORA FUNCEF
                  ' ORDER BY B.NOME'); //-- 1 PARA FONTE PAGADORA INSS


type

  TfrmReajusteBenef = class(TfrmOkCancelar)
    pgcDadoBenef: TPageControl;
    tsDadosBenef: TTabSheet;
    tsListaMatricula: TTabSheet;
    lblPlanoPrevidenciario: TLabel;
    lblPeriodoIndice: TLabel;
    lblFontePagadora: TLabel;
    lblPercentualFRB: TLabel;
    lblPeriodoRecal: TLabel;
    lblPeriodoAcerto: TLabel;
    Label7: TLabel;
    chkAtualizaBenef: TCheckBox;
    chkListaMatricula: TCheckBox;
    chkFRB: TCheckBox;
    GroupBox1: TGroupBox;
    lblProcessarBenef: TLabel;
    ckAtivo: TCheckBox;
    IvExtendedTranslator1: TIvExtendedTranslator;
    ckEncerrado: TCheckBox;
    ckRetido: TCheckBox;
    rbFuncef: TRadioButton;
    rbFontePagInss: TRadioButton;
    mObservacao: TMemo;
    cbxTodosBenef: TCheckBox;
    lblObservacao: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lblPeriodo: TLabel;
    ListBeneficios: TCheckListBox;
    edtIndiceIni: TMaskEdit;
    edtRecalculoIni: TMaskEdit;
    edtPeriodoAcertoInicio: TMaskEdit;
    edtPeriodoAcertoFim: TMaskEdit;
    edtRecalculoFim: TMaskEdit;
    edtIndiceFim: TMaskEdit;
    lblMesCobrancaInss: TLabel;
    edtMesCobrancaInss: TMaskEdit;
    grpLote: TGroupBox;
    lblLote: TLabel;
    lblMesFolha: TLabel;
    lblMotivacao: TLabel;
    lblDataPagamento: TLabel;
    lblAlteradores: TLabel;
    edtMedFolha: TMaskEdit;
    cbxDataPagamento: TwwDBDateTimePicker;
    qryBeneficios: TwwQuery;
    dsBeneficios: TwwDataSource;
    dspBeneficio: TDataSetProvider;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    BitBtn5: TBitBtn;
    dsLote: TwwDataSource;
    dsMotivo: TwwDataSource;
    dsAlteradores: TwwDataSource;
    qryLote: TwwQuery;
    qryMotivo: TwwQuery;
    qryReajuste: TwwQuery;
    testeLoteIDLOTE: TFloatField;
    strngfldLoteDESCRICAO: TStringField;
    testeMotivoIDMOTIVO: TFloatField;
    strngfldMotivoDESCRICAO: TStringField;
    qryPlanoPrev: TwwQuery;
    dsPlanoPrev: TwwDataSource;
    testePlanoPrevIDPLANOPREV: TFloatField;
    strngfldPlanoPrevNOME: TStringField;
    MontaSelect1: TMontaSelect;
    OpenDialog: TOpenDialog;
    edtPercentualFRB: TRealEdit;
    frmfrmlstbnf: TfrmFrameListaBenef;
    Panel1: TPanel;
    Label18: TLabel;
    edtBuscaArquivo: TEdit;
    btnCarrega: TBitBtn;
    qryArquivo: TwwQuery;
    BitBtn1: TBitBtn;
    qryArquivoMATRICULADEP: TStringField;
    qryArquivoNOMEDEP: TStringField;
    qryArquivoMATRICULA: TStringField;
    qryArquivoNOMETITULAR: TStringField;
    qryArquivoIDPESSOA: TFloatField;
    qryArquivoIDTITULAR: TFloatField;
    qryAux: TwwQuery;
    qryInsert: TwwQuery;
    cbxAlteradores: TComboBox;
    qryReajusteIDREAJUSTE: TFloatField;
    qryInsertListabenefReajust: TwwQuery;
    ProcReajuste: TStoredProc;
    wwQuery1: TwwQuery;
    ClientDataSet1: TClientDataSet;
    cbxPlanoPrev: TComboBox;
    cbxLote: TComboBox;
    cbxMotivo: TComboBox;
    qryMesFolha: TwwQuery;
    wwMatriculas: TwwQuery;
    wwTable1: TwwTable;
    connTB: TADOConnection;
    AdoDsMatriculas: TADODataSet;

    procedure FormCreate(Sender: TObject);
    procedure chkListaMatriculaClick(Sender: TObject);
    procedure chkAtualizaBenefClick(Sender: TObject);
    procedure rbFontePagInssClick(Sender: TObject);
    procedure rbFuncefClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxTodosBenefClick(Sender: TObject);
    procedure DadosBeneficio;
    procedure PesquisaArquivo; // busca de documento no diretorio
    procedure CarregaGridArquivo;//carrega dados para o grid
    procedure AbreQryLista;
    procedure btnCarregaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frmfrmlstbnfbbtnIncluiBenefClick(Sender: TObject);
    procedure frmfrmlstbnfbbtnExcluiCorrenteClick(Sender: TObject);
    procedure IncluirPessoaLista;
    procedure IncluirNovaLista;
    procedure IncluiPessoaLista(aidtitular, aidpessoa: integer);
    procedure ExcluiPessoaLista(aidtitular, aidpessoa: integer);
    procedure BitBtn5Click(Sender: TObject);
    procedure frmfrmlstbnfbbtnIncluiListaClick(Sender: TObject);
    procedure cbxPlanoPrevClick(Sender: TObject);
    procedure cbxMotivoClick(Sender: TObject);
    procedure cbxLoteClick(Sender: TObject);
    procedure MesFolha(sIDLote : Integer);


  private
    { Private declarations }

  public
    ListaIdBenef: TStringList;
    ListBeneficioFlg: TStringList;
    arquivo : TStringList;
    ListaUsuario: integer;
    vListaUsuario : integer;
    vIdReajusteBenef : integer;
    ProcessoLista: boolean;
    vIDPlanoBenef :integer;
    vIDLote : integer;
    vIDMotivo :integer;
    procedure CarregaBeneficios(FontePagadora : String);
    procedure LimparCampos;
    procedure Parametrizacao;
    procedure InsertListaBenef;
    procedure ExeProc;
    procedure CarregaCampos;
    procedure CarregarListaUsuario;

    procedure LimparTela;
    { Public declarations }
  end;

var
  frmReajusteBenef: TfrmReajusteBenef;





implementation
     Uses UAdmPrev,UDataBase, fAguarde,DBaseDados, uAutorizacao;


{$R *.DFM}

procedure TfrmReajusteBenef.FormCreate(Sender: TObject);
begin
  inherited;
  arquivo := TStringList.Create;
  ListBeneficioFlg := TStringList.Create;
  ListaIdBenef := TStringList.Create;
  tsListaMatricula.TabVisible:=False;
  CarregaCampos;
  CarregaBeneficios('0');
  frmfrmlstbnf.bbtnIncluiLista.Visible := false;

  if (rbFontePagInss.Checked)then begin
      lblMesCobrancaInss.Visible := True;
      edtMesCobrancaInss.Visible := True;
  end else begin
      lblMesCobrancaInss.Visible := False;
      edtMesCobrancaInss.Visible := False;
  end;
  lblMesCobrancaInss.Visible := False;

end;


procedure TfrmReajusteBenef.chkListaMatriculaClick(Sender: TObject);
begin
  if (chkListaMatricula.Checked) then
     tsListaMatricula.TabVisible := True
  else begin
    edtBuscaArquivo.Text := '';
     tsListaMatricula.TabVisible := False;
  end;
end;

procedure TfrmReajusteBenef.chkAtualizaBenefClick(Sender: TObject);
begin
  inherited;
  if (chkAtualizaBenef.Checked) then begin
      grpLote.Visible := False;
      edtPeriodoAcertoInicio.Visible := False;
      edtPeriodoAcertoFim.Visible := False;
      lblPeriodoAcerto.Visible := False;
      lblPeriodo.Visible := False;
      edtMesCobrancaInss.Visible := False;
      edtMesCobrancaInss.Text := '';
      lblMesCobrancaInss.Visible := False;
      LimparCampos;                       
  end else begin
      grpLote.Visible := True;
      edtPeriodoAcertoInicio.Visible := True;
      edtPeriodoAcertoFim.Visible := True;
      lblPeriodoAcerto.Visible := True;
      lblPeriodo.Visible := True;
      if (not chkAtualizaBenef.Checked) and (rbFontePagInss.cheCked) then  begin
         edtMesCobrancaInss.Visible := True;
         lblMesCobrancaInss.Visible := True;

      end;
  end;
end;

procedure TfrmReajusteBenef.rbFontePagInssClick(Sender: TObject);
begin
  inherited;
  if (rbFontePagInss.Checked)then begin


      if (not chkAtualizaBenef.Checked)then  begin
         edtMesCobrancaInss.Visible := True;
         lblMesCobrancaInss.Visible := True;
      end else begin
         edtMesCobrancaInss.Visible := False;
         lblMesCobrancaInss.Visible := False;
      end;

       lblPercentualFRB.Visible := False;
      edtPercentualFRB.Visible := False;
      chkFRB.Visible := False;
      CarregaBeneficios('1');
  end else begin
      lblMesCobrancaInss.Visible := False;
      edtMesCobrancaInss.Visible := False;
      lblPercentualFRB.Visible := True;
      edtPercentualFRB.Visible := True;
      chkFRB.Visible := True;
      CarregaBeneficios('0');
  end;
  cbxTodosBenef.Checked := False;
end;

procedure TfrmReajusteBenef.rbFuncefClick(Sender: TObject);
begin
  inherited;
  if (rbFontePagInss.Checked)then begin
      lblMesCobrancaInss.Visible := True;
      edtMesCobrancaInss.Visible := True;
      lblPercentualFRB.Visible := False;
      edtPercentualFRB.Visible := False;
      chkFRB.Visible := False;
      CarregaBeneficios('1');
  end else begin
      lblMesCobrancaInss.Visible := False;
      edtMesCobrancaInss.Visible := False;
      lblPercentualFRB.Visible := True;
      edtPercentualFRB.Visible := True;
      chkFRB.Visible := True;
      edtMesCobrancaInss.Text := '    /  ';
      CarregaBeneficios('0');
  end;
  cbxTodosBenef.Checked := False;
end;

procedure TfrmReajusteBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ListaIdBenef);
end;

procedure TfrmReajusteBenef.CarregaBeneficios(FontePagadora : String);
begin
      ListBeneficios.Clear;
      ListaIdBenef.Clear;
      qryBeneficios.Close;

      if (cbxPlanoPrev.Text <> 'Todos os Planos') and (cbxPlanoPrev.ItemIndex <> - 1) then
      begin
         qryBeneficios.Sql.text := (sSQLBenef);
         qryBeneficios.ParamByName('IDPLANOPREV').AsInteger := vIDPlanoBenef;
         qryBeneficios.ParamByName('FONTEPAGADORA').AsString := FontePagadora;
          qryBeneficios.Prepare;
      end
      else
      begin
         qryBeneficios.Sql.Text:= (sSQLTodosBenef);
         qryBeneficios.ParamByName('FONTEPAGADORA').AsString := FontePagadora;
         qryBeneficios.Prepare;
      end;
      qryBeneficios.Open;

  while not(qryBeneficios.EOF) do
  begin
    ListaIdBenef.Add(qryBeneficios.FieldByName('IDBENEFICIO').asString);
    ListBeneficios.Items.Add(qryBeneficios.FieldByName('NOME').asString);
    qryBeneficios.Next;
  end;
end;

procedure TfrmReajusteBenef.cbxTodosBenefClick(Sender: TObject);
var
  c:Integer;
begin
  inherited;
  if (cbxTodosBenef.Checked) then begin
      for c:=0 to ListBeneficios.Items.Count-1 do
          ListBeneficios.Checked[c] := True;
      ListBeneficios.Repaint;
  end
  else begin
      for c:=0 to ListBeneficios.Items.Count-1 do
            ListBeneficios.Checked[c] := False;
      ListBeneficios.Repaint;
  end;

  if (cbxTodosBenef.Checked) then
     ListBeneficios.Enabled := false
  else
     ListBeneficios.Enabled := true;

end;

procedure TfrmReajusteBenef.DadosBeneficio;
var c:Integer;
begin
  ListBeneficioFlg.Clear;
  for c:=0 to ListBeneficios.Items.Count-1 do begin
      if (ListBeneficios.Checked[c])then
              ListBeneficioFlg.Add(ListaIdBenef.Strings[c])
  end;
end;

procedure TfrmReajusteBenef.PesquisaArquivo;
begin
  OpenDialog.Execute;
  edtBuscaArquivo.Text := OpenDialog.FileName;
end;

procedure TfrmReajusteBenef.btnCarregaClick(Sender: TObject);
begin
  inherited;
  ProcessoLista := True;
  if edtBuscaArquivo.Text <> '' then
     CarregaGridArquivo;
end;

procedure TfrmReajusteBenef.CarregaGridArquivo;
var c : Integer;
    aux, ssql :string;
    matricula : boolean;
    i, total :integer;
    arqMatriculas: TextFile;
    sMatricula : string;
begin
  frmAguarde.pbAguarde.Max := 100;
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Carregando ... ');

(* SIG 80018 - Osni Cavalcante - Início do trecho de alteração *)
  AssignFile(arqMatriculas, OpenDialog.FileName);
  ReSet(arqMatriculas);

  connTB.Close;
  connTB.ConnectionString := Autorizacao.getStringConexaoADO;

  connTB.Execute('delete from cm.MatriculasContrib',cmdText);

  AdoDsMatriculas.close;
  AdoDsMatriculas.CommandText := 'select Matricula from cm.MatriculasContrib';
  AdoDsMatriculas.Open;

  AdoDsMatriculas.DisableControls;

  AdoDsMatriculas.Connection.BeginTrans;
  while not eof(arqMatriculas) do
  begin
     ReadLn(arqMatriculas, sMatricula);
     AdoDsMatriculas.Append;
     AdoDsMatriculas.FieldByName('Matricula').Value := sMatricula;
  end;

  AdoDsMatriculas.UpdateBatch(arAll);
  AdoDsMatriculas.Connection.CommitTrans;
  AdoDsMatriculas.enablecontrols;

  qryArquivo.close;
  qryArquivo.sql.clear;
  aux := 'SELECT ' +
         '  D.MATRICULA AS MATRICULADEP,' +
         '  P.NOME AS NOMEDEP,' +
         '  DT.MATRICULA AS MATRICULA,' +
         '  PT.NOME AS NOMETITULAR,' +
         '  P.IDPESSOA AS IDPESSOA,' +
         '  PT.IDPESSOA AS IDTITULAR ' +
         'FROM DEPENTIT D ' +
         'inner join PESSOA P on P.IDPESSOA  = D.IDPESSOA ' +
         'inner join DEPENTIT DT on DT.IDPESSOA = D.IDTITULAR ' +
         'inner join PESSOA PT on PT.IDPESSOA = DT.IDTITULAR ' +
         'WHERE exists (select mc.matricula from cm.matriculascontrib mc where mc.matricula = d.matricula)';
  qryArquivo.SQL.Text := aux;

(* SIG 80018 - Osni Cavalcante - Fim do trecho de alteração *)

  qryArquivo.Open;
  frmAguarde.Pos := 50;
  frmfrmlstbnf.qryLista.disablecontrols;
  while not qryArquivo.Eof do
  begin
    IncluiPessoaLista(qryArquivoIDTITULAR.AsInteger, qryArquivoIDPESSOA.AsInteger);
    qryArquivo.Next;
  end;
  frmfrmlstbnf.qryLista.enablecontrols;
  AbreQryLista;

  aux := '';
  for c:=1 to arquivo.Count - 1 do
  begin
    matricula := true;
    qryArquivo.First;
    while not qryArquivo.Eof do
    begin
       if (qryArquivoMATRICULADEP.AsString = arquivo.Strings[c])then begin
           matricula := false;
           Break;
       end;
       qryArquivo.Next;
    end;
    if matricula then
          aux := aux + arquivo.Strings[c] + #13;
  end;
  frmAguarde.Pos := 100;
  frmAguarde.Close;
  if (Aux <>'') then
     MsgDlg('As matrículas abaixo não estão cadastradas no sistema: '+#13 + Aux,'Aviso',mtInformation,[mbOk],0);

end;

procedure TfrmReajusteBenef.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PesquisaArquivo;

end;

procedure TfrmReajusteBenef.frmfrmlstbnfbbtnIncluiBenefClick(
  Sender: TObject);
begin
  inherited;
  edtBuscaArquivo.Text := '';
  frmfrmlstbnf.bbtnIncluiBenefClick(Sender);

end;

procedure TfrmReajusteBenef.frmfrmlstbnfbbtnExcluiCorrenteClick(
  Sender: TObject);
begin
  inherited;
  if (not frmfrmlstbnf.qryLista.IsEmpty) then begin
    ProcessoLista := false;
    if edtBuscaArquivo.Text = '' then
      frmfrmlstbnf.bbtnExcluiCorrenteClick(Sender)
    else
      ExcluiPessoaLista(frmfrmlstbnf.qryLista.fieldbyname('IDTITULAR').asinteger,frmfrmlstbnf.qryLista.fieldbyname('IDPESSOA').asinteger);
  end;
end;

procedure TfrmReajusteBenef.IncluirPessoaLista;
begin
  if ListaUsuario = 0 then
    IncluirNovaLista;
  qryAux.SQL.Clear;
  qryaux.SQL.add('INSERT INTO LISTAFOLHABENEFDET (IDLISTA, IDTITULAR,IDPESSOA,IDREFERENCIA) VALUES ('+
        ' :IDLISTA, :IDTITULAR,:IDPESSOA,:IDREFERENCIA )');
  qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario;
  qryAux.ParamByName('IDTITULAR').AsFloat := qryArquivoIDTITULAR.AsInteger;
  qryAux.ParamByName('IDPESSOA').AsFloat := qryArquivoIDPESSOA.AsInteger;
  qryaux.ParamByName('IDREFERENCIA').AsFloat := 0;
  try
    qryaux.ExecSQL;
  except
  end;
  if not ProcessoLista then
    AbreQryLista;
end;

procedure TfrmReajusteBenef.IncluirNovaLista;
var ssql :string;
begin
  ssql:='SELECT IDLISTA '+
        'FROM LISTAFOLHABENEF '+
        'WHERE IDUSUARIO = '+inttostr(Sistema.IdUsuario) +
        '      and FLGTIPOLISTA = 2'; // SIG80018 - Osni Cavalcante
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(ssql);
  qryAux.open;
  if qryAux.Eof  then
  begin
    ListaUsuario := LeUltRegistro(Nil,'LISTAFOLHABENEF');
    qryaux.sql.Clear;
    qryaux.SQL.add('INSERT INTO LISTAFOLHABENEF(IDLISTA,FLGTIPOLISTA,NOME,IDUSUARIO) VALUES ('+
                   ' :IDLISTA,:FLGTIPOLISTA,:NOME,:IDUSUARIO)');
    qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario;
    qryAux.ParamByName('FLGTIPOLISTA').AsFloat := 2;
    qryaux.ParamByName('NOME').AsString := Sistema.NomeUsuario;
    qryAux.ParamByName('IDUSUARIO').AsFloat := Sistema.IdUsuario;
    try
      qryaux.ExecSQL;
    except
    end;
   end
   else
  begin
     ListaUsuario := QryAux.FieldByName('IDLISTA').AsInteger;
  end;
end;

procedure TfrmReajusteBenef.AbreQryLista;
begin
  frmfrmlstbnf.ListaUsuario :=ListaUsuario;
  frmfrmlstbnf.qryLista.close;
  frmfrmlstbnf.qryLista.ParamByName('IDLISTA').Asfloat := ListaUsuario;
  frmfrmlstbnf.qryLista.open;
  frmfrmlstbnf.lblQuant.caption:='  Quantidade: '+inttostr(frmfrmlstbnf.qryLista.recordcount)+'  ';
end;

procedure TfrmReajusteBenef.IncluiPessoaLista(aidtitular,
aidpessoa: integer);
 var ssql: string;
begin
  if ListaUsuario = 0 then
    IncluirNovaLista;
  qryaux.sql.Clear;
  qryaux.SQL.add('INSERT INTO LISTAFOLHABENEFDET (IDLISTA, IDTITULAR,IDPESSOA,IDREFERENCIA) VALUES ('+
        ' :IDLISTA, :IDTITULAR,:IDPESSOA,:IDREFERENCIA )');
  qryAux.ParamByName('IDLISTA').AsFloat := ListaUsuario;
  qryAux.ParamByName('IDTITULAR').AsFloat := AidTitular;
  qryAux.ParamByName('IDPESSOA').AsFloat := AidPessoa;
  qryaux.ParamByName('IDREFERENCIA').AsFloat := 0;

  try
    qryaux.ExecSQL;
  except

  end;
  if not ProcessoLista then
    AbreQryLista;
end;

procedure TfrmReajusteBenef.ExcluiPessoaLista(aidtitular,
  aidpessoa: integer);
var ssql: string;
begin
  ssql:='DELETE FROM LISTAFOLHABENEFDET '+
        'WHERE IDLISTA = '+inttostr(ListaUsuario)+' '+
        'AND IDTITULAR = '+inttostr(aidtitular)+' '+
        'AND IDPESSOA = '+inttostr(aidpessoa) + ' '+
        'AND FLGTIPOLISTA = 2';
  ExecutarQuery(qryAux, ssql);
  if not ProcessoLista then
    AbreQryLista;
end;
procedure TfrmReajusteBenef.BitBtn5Click(Sender: TObject);
var vObrigatorio, vObrigatorioDef : String;
begin
  inherited;
  DadosBeneficio;
  vObrigatorio := '';
  vObrigatorioDef:= 'Para a execução do reajuste é necessário que os atributos, de preenchimento obrigatório, sejam preenchidos.' +#13;

  if (chkListaMatricula.Checked) and(frmfrmlstbnf.qryLista.IsEmpty)then begin
     MsgDlg('Você não listou nenhuma matrícula na lista de matrículas.','Aviso',mtInformation,[mbOk],0);
     exit;
     end;

  if (edtIndiceIni.Text = '    /  ' ) or (edtIndiceFim.Text = '    /  ') then
     vObrigatorio := vObrigatorio +  lblPeriodoIndice.Caption+#13;

  if (edtRecalculoIni.Text = '    /  ' ) or (edtRecalculoFim.Text = '    /  ')  then
     vObrigatorio := vObrigatorio +  lblPeriodoRecal.Caption+#13;

  if ((edtPeriodoAcertoInicio.Text = '    /  ' ) or (edtPeriodoAcertoFim.Text = '    /  '))and (not(chkAtualizaBenef.Checked)) then
     vObrigatorio := vObrigatorio +  lblPeriodoAcerto.Caption+#13;

  if (edtPercentualFRB.Text = '0,00' )and (edtPercentualFRB.Visible = True) and (chkFRB.Checked) then
     vObrigatorio := vObrigatorio +  lblPercentualFRB.Caption+#13;

  if (not rbFontePagInss.Checked) and (not rbFuncef.Checked) then
     vObrigatorio := vObrigatorio +  lblFontePagadora.Caption+#13;

  if not(chkAtualizaBenef.Checked) then begin

      if(cbxLote.ItemIndex = -1)   then
         vObrigatorio := vObrigatorio +  lblLote.Caption+#13;

      if(cbxMotivo.ItemIndex = -1) then
         vObrigatorio := vObrigatorio +  lblMotivacao.Caption+#13;

      if(cbxAlteradores.Text = '') then
         vObrigatorio := vObrigatorio +  lblAlteradores.Caption+#13;
   end;

   if ((rbFontePagInss.Checked) and (edtMesCobrancaInss.Text = '    /  ') and (not chkAtualizaBenef.Checked)) then
      vObrigatorio := vObrigatorio + lblMesCobrancaInss.Caption+#13;


   if (mObservacao.Text = '')then
         vObrigatorio := vObrigatorio +  'Observação'+#13;

  if (vObrigatorio <>'')then begin
        MsgDlg(vObrigatorioDef + vObrigatorio,'Aviso',mtInformation,[mbOk],0);
        Exit;
  end;

  // if (ListaUsuario = 0) and (not chkListaMatricula.Checked) then
  //    IncluirNovaLista;


  Parametrizacao;
  InsertListaBenef;
  ExeProc;
  qryInsert.Close;
  vListaUsuario := 0;
  LimparTela;
  LimparCampos;
  frmfrmlstbnf.qryLista.Close;
  frmfrmlstbnf.lblQuant.caption:= '';


end;

procedure TfrmReajusteBenef.Parametrizacao;
var sSQL : String;

    BlobField: TBlobField;
    vPercentualFRB : String;
    vPercentual :Double;
begin
   try
      //dtmBaseDados.dbBaseDados.StartTransaction;
      qryReajuste.Close;
      qryReajuste.Open;
      qryInsert.SQl.Text := sSQLInsert;
      qryInsert.Prepare;
      vIdReajusteBenef := qryReajuste.FieldByName('IDREAJUSTE').ASInteger +1;

      qryInsert.ParamByName('IDREAJUSTEBENEFICIO').AsInteger := vIdReajusteBenef;
      if ((cbxPlanoPrev.ItemIndex <> -1 ) and (cbxPlanoPrev.Text <> 'Todos os Planos'))then
            qryInsert.ParamByName('IDPLANOPREV').AsInteger := vIDPlanoBenef
      else
            qryInsert.ParamByName('IDPLANOPREV').AsString := '';

      if(chkListaMatricula.Checked)then
      begin
         CarregarListaUsuario;
         qryInsert.ParamByName('IDLISTA').AsInteger := vListaUsuario
      end else begin
          qryInsert.ParamByName('IDLISTA').AsString := '';
      end;


      if (chkAtualizaBenef.Checked) then
         qryInsert.ParamByName('FLGAPATUALIZABENEF').ASInteger := 1
      else
         qryInsert.ParamByName('FLGAPATUALIZABENEF').ASInteger := 0;

      if Trim(edtIndiceIni.Text) <> '/' then
         qryInsert.ParamByName('ANOMESINIINDICE').AsString := Trim(edtIndiceIni.Text);

      if Trim(edtIndiceFim.Text) <> '/' then
         qryInsert.ParamByName('ANOMESFIMINDICE').AsString := Trim(edtIndiceFim.Text);

      if Trim(edtRecalculoIni.Text) <> '/' then
         qryInsert.ParamByName('ANOMESINICALC').AsString   := Trim(edtRecalculoIni.Text);

      if Trim(edtRecalculoFim.Text) <> '/' then
         qryInsert.ParamByName('ANOMESFIMCALC').AsString   := Trim(edtRecalculoFim.Text);

      if Trim(edtPeriodoAcertoInicio.Text) <> '/' then
         qryInsert.ParamByName('ANOMESINIACERTO').AsString := Trim(edtPeriodoAcertoInicio.Text);

      if Trim(edtPeriodoAcertoFim.Text) <> '/' then
         qryInsert.ParamByName('ANOMESFIMACERTO').AsString := Trim(edtPeriodoAcertoFim.Text);

      if Trim(edtMesCobrancaInss.Text) <> '/' then
         qryInsert.ParamByName('ANOMESCOMPREEM').AsString  := Trim(edtMesCobrancaInss.Text);

      if (chkFRB.Checked) then
         qryInsert.ParamByName('FLGAPPERCFRB').AsInteger := 1
      else
         qryInsert.ParamByName('FLGAPPERCFRB').AsInteger := 0;

      qryInsert.ParamByName('PERCFRB').AsString := edtPercentualFRB.Text;

      if(rbFuncef.Checked)then
         qryInsert.ParamByName('FONTEPAGADORA').AsInteger := 1
      else
         qryInsert.ParamByName('FONTEPAGADORA').AsInteger := 0;

      if(ckAtivo.Checked)then
         qryInsert.ParamByName('FLGATIVO').AsInteger := 1
      else
         qryInsert.ParamByName('FLGATIVO').AsInteger :=0;

      if(ckRetido.Checked)then
         qryInsert.ParamByName('FLGRETIDO').AsInteger := 1
      else
         qryInsert.ParamByName('FLGRETIDO').AsInteger := 0;

      if(ckEncerrado.Checked)then
         qryInsert.ParamByName('FLGENCERRADO').AsInteger := 1
      else
         qryInsert.ParamByName('FLGENCERRADO').AsInteger := 0;

      if(cbxLote.ItemIndex <> -1)then
         qryInsert.ParamByName('IDLOTE').AsInteger   :=  vIDLote;

      if(cbxLote.ItemIndex <> -1)then
         qryInsert.ParamByName('IDMOTIVO').AsInteger :=  vIDMotivo;

      qryInsert.ParamByName('FLGALTERADORES').AsInteger := cbxAlteradores.ItemIndex;

      if(cbxTodosBenef.Checked)then
         qryInsert.ParamByName('FLGREAJUSTETOTAL').AsInteger := 1
      else
         qryInsert.ParamByName('FLGREAJUSTETOTAL').AsInteger := 0;


      mObservacao.Lines.SaveToFile('C:\Planus\Temp\Observacao.tmp');
      qryInsert.ParamByName('OBSERVACAO').LoadFromFile('C:\Planus\Temp\Observacao.tmp',ftBlob);

      qryInsert.ParamByName('TRGDTINCLUSAO').AsDateTime := Now;

      qryInsert.ParamByName('TRGUSERINCLUSAO').AsString := 'CM'+IntToStr(Sistema.IdUsuario);
      qryInsert.ExecSQL;

      CommitTransacao;

   except
         RollBackTransacao;
   end;
end;

procedure TfrmReajusteBenef.InsertListaBenef;
var c: Integer;
    qryList: TwwQuery;
    List : Integer;
begin
   if not(cbxTodosBenef.Checked) then begin
     try
       qryReajuste.Close;
       qryReajuste.Open;
       qryList := TwwQuery.Create(Application);
       qryList.DatabaseName := 'BaseDados';
       qryList.SQL.Text := sSQLList;
       qryList.Close;
       qryList.open;
       List := qryList.FieldByName('IDLISTABENEF').AsInteger + 1;
       for c:=0 to ListBeneficioFlg.Count-1 do begin
           qryInsertListabenefReajust.ParamByName('IDLISTABENEFICIOREAJUSTE').AsInteger := List+c;
           qryInsertListabenefReajust.ParamByName('IDREAJUSTEBENEFICIO').AsInteger := vIdReajusteBenef;//qryReajuste.FieldByName('IDREAJUSTE').AsInteger;
           qryInsertListabenefReajust.ParamByName('IDBENEFICIO').AsInteger := StrToInt(ListBeneficioFlg.Strings[c]);
           qryInsertListabenefReajust.ParamByName('TRGDTINCLUSAO').AsDateTime := now;
           qryInsertListabenefReajust.ParamByName('TRGUSERINCLUSAO').AsString := 'CM' + IntToStr(Sistema.IdUsuario);
           qryInsertListabenefReajust.ExecSQL;
       end;
       CommitTransacao;
       qryList.Destroy;
     except
       RollBackTransacao;
     end;
   end;
end;

procedure TfrmReajusteBenef.ExeProc;
var
  //qryProc : TwwQuery;
  //k : Integer;
  //Cont: Treajuste;
  //Progess: TReajustProcessBar;

  qryProc : TwwQuery;
  k : Integer;
  sSQLProcesso : string;
begin
  try
     frmAguarde.pbAguarde.Max := 100;
     frmAguarde.Pos := 0;
     frmAguarde.Mostra('Processando ... ');
     ProcReajuste.ParamByName('IN_IDREAJUSTEBENEFICIO').AsInteger := vIdReajusteBenef;// qryReajuste.FieldByName('IDREAJUSTE').AsInteger;
     ProcReajuste.Prepare;
     ProcReajuste.ExecProc;
     frmAguarde.Pos := 100;
     frmAguarde.Close;
     MsgDlg('Reajuste realizado com sucesso','Aviso',mtInformation,[mbOk],0);

  except
      on E:EDBEngineError do
      begin
           MostrarErro(E);
           frmAguarde.Close;
           Exit;
      end;
  end;
end;

procedure TfrmReajusteBenef.LimparCampos;
begin
  cbxLote.ItemIndex :=-1;
  edtMedFolha.text := '';
  cbxDataPagamento.Text := '';
  cbxMotivo.ItemIndex :=-1;
  cbxAlteradores.Text := '';
end;

procedure TfrmReajusteBenef.frmfrmlstbnfbbtnIncluiListaClick(
  Sender: TObject);
begin
  inherited;
  frmfrmlstbnf.bbtnIncluiListaClick(Sender);
end;

procedure TfrmReajusteBenef.CarregaCampos;
begin

  qryPlanoPrev.Open;
  while not qryPlanoPrev.Eof do begin
     cbxPlanoPrev.Items.AddObject(qryPlanoPrev.FieldByName('NOME').AsString, TObject(qryPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
     qryPlanoPrev.Next;
  end;
  cbxPlanoPrev.Items.Add('Todos os Planos');
  cbxPlanoPrev.ItemIndex := 3;

  qryLote.Open;
  while not qryLote.Eof do begin
     cbxLote.Items.AddObject(qryLote.FieldByName('DESCRICAO').AsString, TObject(qryLote.FieldByName('IDLOTE').AsInteger));
     qryLote.Next;
  end;

  qryMotivo.Open;
  while not qryMotivo.Eof do begin
     cbxMotivo.Items.AddObject(qryMotivo.FieldByName('DESCRICAO').AsString, TObject(qryMotivo.FieldByName('IDMOTIVO').AsInteger));
     qryMotivo.Next;
  end;


end;

procedure TfrmReajusteBenef.cbxPlanoPrevClick(Sender: TObject);
begin
  inherited;
 vIDPlanoBenef := longInt(cbxPlanoPrev.Items.Objects[cbxPlanoPrev.ItemIndex]);
 if rbFuncef.Checked then
   CarregaBeneficios('0')
  else
    CarregaBeneficios('1');


end;

procedure TfrmReajusteBenef.cbxMotivoClick(Sender: TObject);
begin
  inherited;
  vIDMotivo := longInt(cbxMotivo.Items.Objects[cbxMotivo.ItemIndex]);
end;

procedure TfrmReajusteBenef.cbxLoteClick(Sender: TObject);
begin
  inherited;
  vIDLote := longInt(cbxLote.Items.Objects[cbxLote.ItemIndex]);
  MesFolha(vIDLote);
end;

procedure TfrmReajusteBenef.CarregarListaUsuario;
var ssql: string;
begin
  ssql:='SELECT IDLISTA '+
        'FROM LISTAFOLHABENEF '+
        'WHERE IDUSUARIO = '+inttostr(Sistema.IdUsuario) ;
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(ssql);
  qryAux.open;
  vListaUsuario := QryAux.FieldByName('IDLISTA').AsInteger;

end;

procedure TfrmReajusteBenef.MesFolha(sIDLote: Integer);
begin
  qryMesFolha.close;
  qryMesFolha.ParamByName('IDLOTE').AsInteger :=  sIDLote;
  qryMesFolha.Open;
  edtMedFolha.Text := qryMesFolha.FieldByName('MESREFERENCIA').AsString;
  cbxDataPagamento.Date := qryMesFolha.FieldByName('DATAPAGAMENTO').AsDateTime;

end;

procedure TfrmReajusteBenef.LimparTela;
begin
    rbFontePagInss.Checked := true;
    edtIndiceIni.text :=   '    /  ';
    edtIndiceFim.text :=   '    /  ';
    edtRecalculoIni.text :=   '    /  ';
    edtRecalculoFim.text :=   '    /  ';
    edtPeriodoAcertoInicio.text :=   '    /  ';
    edtPeriodoAcertoFim.text :=   '    /  ';
    edtPercentualFRB.text := '0,00';
    chkFRB.Checked       := False;
    ckAtivo.Checked      := False;
    ckRetido.Checked     := False;
    ckEncerrado.Checked  := False;
    rbFuncef.Checked     := True;
    rbFontePagInss.Checked := False;
    cbxTodosBenef.Checked := False;
    edtMesCobrancaInss.Text :=   '    /  ';
    mObservacao.Lines.Clear;
    cbxPlanoPrev.ItemIndex := -1;
    chkAtualizaBenef.Checked := false;
    chkListaMatricula.Checked := false;
end;

end.
