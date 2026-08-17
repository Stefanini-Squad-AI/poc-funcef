unit FAtualizaOperacaoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FProcuraCliFor, TEdNum, wwdblook, CMDBLookupCombo,
  Buttons, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, CMProcuraSubTipo,
  ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, uCtrlParamIntegra,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlAtualizaOperacao;

type
  TFrmAtualizaOperacaoMT = class(TFrmProcuraCliFor)
    Label7: TLabel;
    dessel: TwwDataSource;
    Panel2: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    CMDBtpdocto: TCMDBLookupCombo;
    Label2: TLabel;
    dtlanc: TCMDateTimePicker;
    Label6: TLabel;
    dtlancfinal: TCMDateTimePicker;
    BitBtn1: TBitBtn;
    cm: TwwDBGrid;
    cdsDoc: TCMClientDataSet;
    sqlDoc: TCMSqlParams;
    cdsSel: TCMClientDataSet;
    sqlSel: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpaGrid;

    procedure cmCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CPForCliChange(Sender: TObject);
    procedure CMDBtpdoctoChange(Sender: TObject);
    procedure dtlancChange(Sender: TObject);
    procedure dtlancfinalChange(Sender: TObject);
  private
    { Private declarations }
    _AtualizaOperacao : TCtrlAtualizaOperacao;
  public
    { Public declarations }
  end;

var
  FrmAtualizaOperacaoMT: TFrmAtualizaOperacaoMT;

implementation

uses usistema, udatabase, DBaseDados, UMensErro;

{$R *.DFM}

procedure TFrmAtualizaOperacaoMT.LimpaGrid;
begin
  if cdsSel.Active then cdsSel.Close;
  with sqlSel.SQL do
  begin
    Clear;
    Append('SELECT                                ');
    Append('  D.CODDOCUMENTO,                     ');
    Append('  D.NODOCUMENTO,                      ');
    Append('  D.COMPLDOCUMENTO,                   ');
    Append('  D.OPERACAO AS OPERACAOANTERIOR,     ');
    Append('  D.DATAVENCTO,                       ');
    Append('  D.DATAPROGRAMADA,                   ');
    Append('  D.OPERACAO,                         ');
    Append('  L.DATALANCTO,                       ');
    Append('  L.NUMLANCTO,                        ');
    Append('  L.VALOR,                            ');
    Append('  P.RAZAOSOCIAL,                      ');
    Append('  TD.DESCRICAO AS DESCRDOCTO          ');
    Append('FROM                                  ');
    Append('  DOCUMENTO D,                        ');
    Append('  LANCTODOCUM L,                      ');
    Append('  TIPODOCRECPAG TD,                   ');
    Append('  PESSOA P                            ');
    Append('WHERE 1 = 2                           ');
  end;
  sqlSel.Open;
end;

procedure TFrmAtualizaOperacaoMT.FormCreate(Sender: TObject);
begin
  inherited;
  _AtualizaOperacao := TCtrlAtualizaOperacao.Create;
  _AtualizaOperacao.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _AtualizaOperacao._cdsSel := cdsSel;

  if ParamIntegra.RecPag = 'P' then
  begin
    HelpContext           := 30001;
    bbtnAjuda.HelpContext := 30001;
  end
  else
  begin
    HelpContext           := 40003;
    bbtnAjuda.HelpContext := 40003;
  end;
  LimpaGrid;
// -----------------------------------------------------------------------------
  sqlDoc.Prepare;
  sqlDoc.Params[0].AsString  := ParamIntegra.RecPag;
  sqlDoc.Params[1].Asinteger := Sistema.IDUsuario;
  sqlDoc.open;
// -----------------------------------------------------------------------------
end;

procedure TFrmAtualizaOperacaoMT.cmCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if Field.FieldName='OPERACAO' then
  begin
    ABrush.color:=$00BFFFFF;
    AFont.Color:= clBlack;
  end;
end;

procedure TFrmAtualizaOperacaoMT.SbAdTodosClick(Sender: TObject);
var
  pos : TBookmark;
begin
  inherited;
  with cdsSel do
  begin
    pos := GetBookmark;
    DisableControls;
    First;
    while not eof  Do
    begin
      Edit;
      FieldByName('OPERACAO').AsString := '1';
      Post;
      Next;
    end;
   GotoBookmark(pos);
   FreeBookmark(pos);
   EnableControls;
 end;
end;


procedure TFrmAtualizaOperacaoMT.SbAdInverteClick(Sender: TObject);
var
  pos :TBookmark;
begin
  inherited;
  with cdsSel do
  begin
    pos := GetBookmark;
    DisableControls;
    First;
    while not EOF Do
    begin
      Edit;
      if FieldByName('OPERACAO').AsString = '1' then
        FieldByName('OPERACAO').AsString := '2'
      else
        FieldByName('OPERACAO').AsString := '1';
      Post;
      Next;
    end;
    GotoBookmark(pos);
    FreeBookmark(pos);
    EnableControls;
  end;
end;


procedure TFrmAtualizaOperacaoMT.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if cdsSel.Active then cdsSel.Close;
  with sqlSel.SQL do
  begin
    Clear;
    Append('SELECT                                                             ');
    Append('  D.CODDOCUMENTO,                                                  ');
    Append('  D.NODOCUMENTO,                                                   ');
    Append('  D.COMPLDOCUMENTO,                                                ');
    Append('  L.DATALANCTO,                                                    ');
    Append('  D.DATAEMISSAO,                                                   ');
    Append('  D.DATAVENCTO,                                                    ');
    Append('  D.DATAPROGRAMADA, D.OPERACAO,                                    ');
    Append('  D.OPERACAO AS OPERACAOANTERIOR,                                  ');
    Append('  L.NUMLANCTO,                                                     ');
    Append('  L.VALOR,                                                         ');
    Append('  P.RAZAOSOCIAL,                                                   ');
    Append('  TD.DESCRICAO AS DESCRDOCTO                                       ');
    Append('FROM                                                               ');
    Append('  DOCUMENTO D,                                                     ');
    Append('  LANCTODOCUM L,                                                   ');
    Append('  TIPODOCRECPAG TD,                                                ');
    Append('  PESSOA P                                                         ');
    Append('  WHERE                                                            ');
    Append('  D.RECPAG = ' + QuotedStr(ParamIntegra.RECPAG)                    );
    Append('  AND (D.OPERACAO IN ( ''2'' ,''1''))                              ');
    Append('  AND (L.ESTORNO IS NULL)                                          ');
    Append('  AND (D.STATUS <> 2)                                              ');
    Append('  AND (D.NUMFATURA IS NULL)                                        ');
    Append('  AND D.IDPESSOA = '+ IntToStr(Sistema.IDEmpresa)                   );
    if trim(CPForCli.Text) <> '' then
      Append('AND D.IDFORCLI = ' + IntToStr(CPForCli.ForCliReg.ID)              );
    if trim(CMDBtpdocto.Text) <> '' then
      Append('AND D.CODTIPDOC = ' + CMDBtpdocto.LookupValue                     );
    if trim(dtlanc.Text) <> '' then
      Append('AND (L.DATALANCTO >= TO_DATE(' + QuotedStr(dtlanc.Text) + ',''DD/MM/YYYY''))');
    if trim(dtlancfinal.Text) <> '' then
      Append('AND (L.DATALANCTO <= TO_DATE('+ QuotedStr(dtlancfinal.Text) + ',''dd/mm/yyyy''))');
    Append('  AND D.IDFORCLI = P.IDPESSOA                                      ');
    Append('  AND D.CODDOCUMENTO = L.CODDOCUMENTO                              ');
    Append('  AND D.OPERACAO = L.OPERACAO                                      ');
    Append('  AND D.CODTIPDOC = TD.CODTIPDOC                                   ');
    Append('ORDER BY                                                           ');
    Append('  P.RAZAOSOCIAL, D.NODOCUMENTO, D.DATAEMISSAO, D.DATAVENCTO    ');
  end;
  sqlSel.Open;
end;

procedure TFrmAtualizaOperacaoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if _AtualizaOperacao.ConfirmaAtualizaOperacao then
    Msgdlg('Operação Efetuada Com Sucesso!' ,'Aviso',mtInformation,[mbOk],0);
end;

procedure TFrmAtualizaOperacaoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsSel.Cancel;
end;

procedure TFrmAtualizaOperacaoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _AtualizaOperacao.Free;
  cdsSel.Close;
  cdsDoc.Close;
end;

procedure TFrmAtualizaOperacaoMT.CPForCliChange(Sender: TObject);
begin
  inherited;
  LimpaGrid;
end;

procedure TFrmAtualizaOperacaoMT.CMDBtpdoctoChange(Sender: TObject);
begin
  inherited;
  LimpaGrid;
end;

procedure TFrmAtualizaOperacaoMT.dtlancChange(Sender: TObject);
begin
  inherited;
  LimpaGrid;
end;

procedure TFrmAtualizaOperacaoMT.dtlancfinalChange(Sender: TObject);
begin
  inherited;
  LimpaGrid;
end;

end.
