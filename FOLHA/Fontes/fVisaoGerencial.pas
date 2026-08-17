// Alterações:
{ ------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 23/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------}


unit fVisaoGerencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, StdCtrls, wwdblook, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  TREdit, TEdNum,uDocumento, uIntegraBack, MontaSelect, fcButton, fcImgBtn,
  fcShapeBtn, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, Menus;

type
  TfrmVisaoGerencial = class(TfrmSairAjuda)
    qryHist: TwwQuery;
    qryHistHISTORICO: TStringField;
    qryHistIDHSTFOLHABENEF: TFloatField;
    dsCAP: TwwDataSource;
    qryCAP: TwwQuery;
    dsContab: TwwDataSource;
    qryContab: TwwQuery;
    dsPlanil: TwwDataSource;
    qryPlanilha: TwwQuery;
    Panel7: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    wwDBLookupCombo1: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    wwDBLookupCombo2: TwwDBLookupCombo;
    RadioGroup1: TRadioGroup;
    GroupBox5: TGroupBox;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Label6: TLabel;
    wwDBGrid3: TwwDBGrid;
    wwDBGrid4: TwwDBGrid;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    wwDBGrid5: TwwDBGrid;
    wwDBGrid6: TwwDBGrid;
    TabSheet4: TTabSheet;
    GroupBox6: TGroupBox;
    Panel8: TPanel;
    Label9: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Panel9: TPanel;
    Memo3: TMemo;
    Panel10: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    DateEdit1: TCMDateTimePicker;
    DateEdit2: TCMDateTimePicker;
    Panel11: TPanel;
    Label12: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    GroupBox7: TGroupBox;
    Panel12: TPanel;
    Label13: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    Panel13: TPanel;
    Memo4: TMemo;
    Panel14: TPanel;
    pgCtrlEstorno: TPageControl;
    TabSheet6: TTabSheet;
    dbgrCAP: TwwDBGrid;
    TabSheet7: TTabSheet;
    Label18: TLabel;
    wwDBGrid9: TwwDBGrid;
    pnlProgbar: TPanel;
    prgBar: TProgressBar;
    qryHistMESREFERENCIA: TStringField;
    GroupBox8: TGroupBox;
    dblkFolha: TwwDBLookupCombo;
    Panel1: TPanel;
    Label14: TLabel;
    DBText5: TDBText;
    Panel2: TPanel;
    wwDBGrid10: TwwDBGrid;
    Label17: TLabel;

    procedure dblkfolhaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryPlanilhaAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkfolhaExit(Sender: TObject);
    procedure dbgrCAPCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormShow(Sender: TObject);
  private
    iidPessoa : Integer;
    procedure AbreQryCAP(opQry : Integer);
    procedure VerificaFornec(idForCli : Integer);
    procedure VerificaCliente(idForCli : Integer);
    procedure SetaAssistido;
(*LIMEZA
    Function LancaDoc(iCodLancCAPCAR,PlnCodigo,idblkParticip,idblkNovoPortForma, iUnidNegoc : Integer;
             sdtenvio,sdtvencto,sNoDocumento, sedMotivo,sTipRecDes,sCentroRespon,sContaCliFor, RecPag:String;
             valor : Real) : Boolean;
*)
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisaoGerencial: TfrmVisaoGerencial;

implementation

Uses UMensErro, dFolha, USistema, UModulo, UDataBase, uAdmPrevFB,
     DBaseDados, ULancContab, faguarde, UObjFolha;

{$R *.DFM}

procedure TfrmVisaoGerencial.dblkfolhaChange(Sender: TObject);
begin
  inherited;
  if dblkfolha.LookupValue <> '' Then
  Begin
    AbreQryCAP(1);
  end;
end;

procedure TfrmVisaoGerencial.FormCreate(Sender: TObject);
begin
  inherited;
  qryHist.close;
  qryHist.SQL.Clear;
  qryHist.SQL.Add(
    'SELECT IDHSTFOLHABENEF, '+
           'IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO, '+
           'MESREFERENCIA '+
    'FROM HSTFOLHABENEF '+
    'WHERE FLGESTADO <> 2 '+
    'AND IDFUNDACAO = '+inttostr(iidfundacao)+' '+
    'ORDER BY IDHSTFOLHABENEF DESC ');
  qryHist.open;

  qryCAP.Prepare;
  qryPlanilha.Prepare;
  qryContab.Prepare;
  WindowState := wsMaximized;
end;

procedure TfrmVisaoGerencial.qryPlanilhaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryContab.Close;
  qryContab.ParamByName('PLNCODIGO').AsInteger := qryPlanilha.FieldByName('PLNCODIGO').AsInteger;
  qryContab.Open;
end;

procedure TfrmVisaoGerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryHist.Close;
  qryCAP.Close;
  qryPlanilha.Close;
  qryContab.Close;
end;

procedure TfrmVisaoGerencial.AbreQryCAP(opQry : Integer);
Begin
  qryCAP.Close;
  qryCAP.SQL.Clear;
  if OpQry = 1 Then
     qryCAP.SQL.Text := 'SELECT D.NODOCUMENTO, D.DATAPROGRAMADA,LANC.VALORLANC, '+
                        'D.IDFORCLI, PFAV.NOME, H.NOMETXT, SALD.SALDO , D.PLACONTA, '+
                        'D.CODDOCUMENTO,D.NODOCUMENTO, D.CODPORTFORMA '+
                        'FROM HSTFOLHABENEFCAP H,DOCUMENTO D, PESSOA PFAV, '+
                        '(SELECT L1.CODDOCUMENTO,SUM(DECODE(L1.DEBCRE,''C'',VALOR,VALOR*-1)) VALORLANC '+
                        '    FROM LANCTODOCUM L1, DOCUMENTO D1 , HSTFOLHABENEFCAP H1'+
                        '    WHERE H1.IDHSTFOLHABENEF = :IDHSTFOLHABENEF   AND '+
                        '          H1.CODDOCUMENTO    = D1.CODDOCUMENTO(+) AND '+
                        '          D1.CODDOCUMENTO = L1.CODDOCUMENTO(+)    AND '+
                        '          L1.OPERACAO <> ''5'' ' +
                        '    GROUP BY L1.CODDOCUMENTO) LANC ,'+
                        '(SELECT L2.CODDOCUMENTO,SUM(DECODE(L2.DEBCRE,''C'',VALOR,VALOR*-1)) SALDO '+
                        '    FROM LANCTODOCUM L2, DOCUMENTO D2, HSTFOLHABENEFCAP H2 '+
                        '    WHERE H2.IDHSTFOLHABENEF = :IDHSTFOLHABENEF   AND '+
                        '          H2.CODDOCUMENTO    = D2.CODDOCUMENTO(+) AND '+
                        '          D2.CODDOCUMENTO    = L2.CODDOCUMENTO(+) '+
                        '    GROUP BY L2.CODDOCUMENTO) SALD '+
                        'WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF   AND '+
                        '      H.CODDOCUMENTO    = D.CODDOCUMENTO (+) AND '+
                        '      D.IDFORCLI        = PFAV.IDPESSOA(+)   AND '+
                        '      D.CODDOCUMENTO    = LANC.CODDOCUMENTO  AND '+
                        '      D.CODDOCUMENTO    = SALD.CODDOCUMENTO'
  else Begin
    qryCAP.SQL.Text := 'SELECT DISTINCT D.NODOCUMENTO, D.DATAPROGRAMADA,LANC.VALORLANC, D.IDFORCLI, '+
                       'PFAV.NOME, H.NOMETXT, SALD.SALDO , D.PLACONTA,D.CODDOCUMENTO, '+
                       'D.NODOCUMENTO, D.CODPORTFORMA '+
                       'FROM HSTFOLHABENEFCAP H,DOCUMENTO D, PESSOA PFAV,HISTRUBSAL HS, '+
//                       '     (SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBCRE,''C'',VALOR,VALOR*-1)) VALORLANC '+   //Everson TIBERO
                       '     (SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1)) VALORLANC '+ //Everson TIBERO
                       '     FROM LANCTODOCUM L, DOCUMENTO D1 , HSTFOLHABENEFCAP H'+
                       '    WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF  AND '+
                       '          H.CODDOCUMENTO  = D1.CODDOCUMENTO(+)  AND '+
                       '          D1.CODDOCUMENTO = L.CODDOCUMENTO(+)   AND '+
                       '          L.OPERACAO <> ''5'' ' +
                       '     GROUP BY L.CODDOCUMENTO) LANC, '+
//                       '(SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBCRE,''C'',VALOR,VALOR*-1)) SALDO '+  //Everson TIBERO
                       '(SELECT L.CODDOCUMENTO,SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1)) SALDO '+//Everson TIBERO
                       '    FROM LANCTODOCUM L, DOCUMENTO D1, HSTFOLHABENEFCAP H '+
                       '    WHERE H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF  AND '+
                       '          H.CODDOCUMENTO  = D1.CODDOCUMENTO(+)  AND '+
                       '          D1.CODDOCUMENTO = L.CODDOCUMENTO(+) '+
                       '    GROUP BY L.CODDOCUMENTO) SALD '+
                       'WHERE HS.IDHSTFOLHABENEF = :IDHSTFOLHABENEF  AND '+
                       'HS.IDPESSOA              = :IDRESPONSAVEL    AND '+
                       'HS.CODDOCUMENTO          = D.CODDOCUMENTO(+) AND '+
                       'H.IDHSTFOLHABENEF        = :IDHSTFOLHABENEF  AND '+
                       'HS.CODDOCUMENTO          = H.CODDOCUMENTO    AND '+
                       'D.IDFORCLI               = PFAV.IDPESSOA(+)  AND '+
                       'D.CODDOCUMENTO           = LANC.CODDOCUMENTO AND '+
                       'D.CODDOCUMENTO           = SALD.CODDOCUMENTO';
    qryCAP.ParamByName('IDRESPONSAVEL').AsInteger   := iidPessoa;
  end;
  if dblkfolha.LookupValue <> ''then
  begin
    qryCAP.ParamByName('IDHSTFOLHABENEF').AsInteger := StrtoInt(dblkfolha.LookupValue);
    qryCAP.Open;
    qryPlanilha.Close;
    qryPlanilha.ParamByName('IDHSTFOLHABENEF').AsInteger := StrtoInt(dblkfolha.LookupValue);
    qryPlanilha.Open;
  end;
End;

procedure TfrmVisaoGerencial.dblkfolhaExit(Sender: TObject);
begin
  inherited;
  if bbtnSair.Focused Then
    exit;
  if dblkfolha.LookupValue = '' Then
  Begin
    MsgDlg('Escolha um histórico de folha. ','Erro',mtError,[mbOk,mbHelp],0);
    dblkfolha.SetFocus;
    exit;
  end;
end;

procedure TfrmVisaoGerencial.dbgrCAPCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if ((Sender as TwwDBGrid).CalcCellCol) = 3 then
		ABrush.color := clBackground;
end;

procedure TfrmVisaoGerencial.VerificaFornec(idForCli : Integer);
Var sSQL : String;
Begin
  sSQL := 'SELECT IDFORCLI FROM EMPRESAFORN WHERE IDFORCLI = '+ inttoStr(idForCli) +
          ' AND IDPESSOA = ' + InttoStr(Sistema.IdEmpresa);
  FazQuery(DtmFolha.qryAux,sSQL);
  if (DtmFolha.qryAux.IsEmpty) Then
     Documento.ForCli.Inserir(idForCli, -1, -1,IntegraBack.Plano,
     prmIdRamoTipoFor, Sistema.IdEmpresa, '', '','','','F',true);
end;

procedure TfrmVisaoGerencial.VerificaCliente(idForCli : Integer);
Var sSQL : String;
Begin
  sSQL := 'SELECT IDFORCLI FROM EMPRESACLIENTE WHERE IDFORCLI = '+ inttoStr(idForCli) +
          ' AND IDPESSOA = ' + InttoStr(Sistema.IdEmpresa);
  FazQuery(DtmFolha.qryAux,sSQL);
  if (DtmFolha.qryAux.IsEmpty) Then
     Documento.ForCli.Inserir(idForCli, -1, -1,IntegraBack.Plano,
     prmIdRamoTipoCli, Sistema.IdEmpresa, '', '','','','C',true);
end;

procedure TfrmVisaoGerencial.SetaAssistido;
begin
  inherited;
  if dblkfolha.text = '' then
  begin
     MsgDlg('Escolha um Histórico. ','Erro',mtError,[mbOk,mbHelp],0);
     exit;
  end;
  AbreQryCAP(2);
end;

procedure TfrmVisaoGerencial.FormShow(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Visão Gerencial da Folha.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
end;

end.
{------------------------------------------------------------------------------|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alterei o form  para contemplar os novos                                   |
|   parametros de integração contábil/financeira da folha                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/07/2003                         |
| PENDÊNCIA: 14491                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/01/2005 A 20/01/2005                         |
| PENDÊNCIA: 17816                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIR PLANILHA DE PROVISÃO DE ABONO ANUAL                                |
|                                                                              |
|------------------------------------------------------------------------------}

