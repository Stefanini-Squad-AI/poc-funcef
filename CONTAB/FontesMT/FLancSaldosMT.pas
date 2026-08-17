unit FLancSaldosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, Mask, StdCtrls, Grids,
  Wwdbigrd, Wwdbgrid, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, TREdit, IvDictio, IvMulti, IvEMulti, uCmSqlParams, DBClient,
  uCMClientDataSet,FLancaContabMT;

type
  TfrmLancSaldosMT = class(TfrmSairAjuda)
    Panel4: TPanel;
    dsLancamentos: TwwDataSource;
    redValor: TRealEdit;
    Label1: TLabel;
    cboValor: TComboBox;
    dblkModulo: TwwDBLookupCombo;
    Label2: TLabel;
    btnFiltra: TBitBtn;
    Label3: TLabel;
    lblDesc: TLabel;
    lblPeriodo: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label6: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    dblkHist: TwwDBLookupCombo;
    mskConta: TMaskEdit;
    cdsLancamentos: TCMClientDataSet;
    cdsHist: TCMClientDataSet;
    sqlLancamentos: TCMSqlParams;
    sqlHist: TCMSqlParams;
    cdsModulo: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    sqlTipoOper: TCMSqlParams;
    cdsTipoOper: TCMClientDataSet;
    dbgrdLancamentos: TwwDBGrid;
    btnPla: TBitBtn;

    {Procedimentos Definidos}
    procedure AbreQuery;

    {Procedimentos Delphi}
    procedure dbgrdLancamentosCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure dbgrdLancamentosTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltraClick(Sender: TObject);
    procedure btnPlaClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancSaldosMT: TfrmLancSaldosMT;
  frmLancaContabMT :TfrmLancaContabMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo,
     uFuncaoGeral, FSaldosPesqMT, fTelaAut;

{$R *.DFM}


procedure TfrmLancSaldosMT.AbreQuery;
begin

   screen.cursor := crSQLWait;

   //Filtra o valor
   case cboValor.itemIndex of
      0: sqlLancamentos.SQL.Add('AND (L.LACVALOR >= :VALOR) ');
      1: sqlLancamentos.SQL.Add('AND (L.LACVALOR >  :VALOR) ');
      2: sqlLancamentos.SQL.Add('AND (L.LACVALOR =  :VALOR) ');
      3: sqlLancamentos.SQL.Add('AND (L.LACVALOR <  :VALOR) ');
      4: sqlLancamentos.SQL.Add('AND (L.LACVALOR <= :VALOR) ');
   end;

   if trim(dblkHist.text) <> '' then
   begin
      sqlLancamentos.SQL.Add('AND (RTRIM(L.HITCODHIST) = RTRIM(:HIST)) ');
   end;

   if Trim(dblkModulo.text) <> '' then
   begin
      sqlLancamentos.SQL.Add('AND (L.IDMODULO =:MODULO) ');
   end;

   //Filtra o Tipo de Operação
   if trim(dblkTipoOper.text) <> '' then
   begin
      sqlLancamentos.SQL.Add('AND (RTRIM(L.TIPCODIGO) = RTRIM(:TIPO)) ');
   end;

   sqlLancamentos.Prepare;
   if cboValor.itemIndex > -1 then
   begin
     sqlLancamentos.ParamByName('VALOR').asFloat := redValor.value;
   end;

   //Filtra o Módulo
   if Trim(dblkModulo.text) <> '' then
   begin
      sqlLancamentos.ParamByName('MODULO').asInteger := cdsModulo.FieldByName('IDMODULO').asInteger;
   end;

   //Filtra o Tipo de Operação
   if trim(dblkTipoOper.text) <> '' then
   begin
      sqlLancamentos.ParamByName('TIPO').asString := cdsTipoOper.FieldByName('TIPCODIGO').asString;
   end;

   //Filtra o Histórico
   if trim(dblkHist.text) <> '' then
   begin
      sqlLancamentos.ParamByName('HIST').asString := cdsHist.FieldByName('HITCODHIST').asString;
   end;

   sqlLancamentos.ParamByName('PLANO').asInteger     := Modulo.iPlano;
   sqlLancamentos.ParamByName('CONTA').asString      := frmSaldosPesquisaMT.cdsSaldos.FieldByName('PLACONTA').asString;
   sqlLancamentos.ParamByName('PERIODO').asInteger   := frmSaldosPesquisaMT.cdsPeriodo.FieldByName('PERNUMERO').asInteger;
   sqlLancamentos.ParamByName('EXERCICIO').asInteger := frmSaldosPesquisaMT.cdsExercicio.FieldByName('PEREXERCICIO').asInteger;

   sqlLancamentos.Open;

   TFloatField(cdsLancamentos.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';

   screen.cursor := crDefault;

end;



procedure TfrmLancSaldosMT.dbgrdLancamentosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;

   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;



procedure TfrmLancSaldosMT.dbgrdLancamentosTopRowChanged(Sender: TObject);
begin
  inherited;

   //Acerta as cores quando muda a linha da grid
   dbgrdLancamentos.invalidate;

end;



procedure TfrmLancSaldosMT.FormShow(Sender: TObject);
begin

   inherited;

   //Preenche a combo-box
   with sqlHist do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlModulo do begin
      Prepare;
      Open;
   end;
   with sqlTipoOper do begin
      Prepare;
      Open;
   end;

   mskConta.editMask := FuncaoGeral.CalcMascaraPorGrau(modulo.sMascaraContas,
                                                       frmSaldosPesquisaMT.cdsSaldos.FieldByName('PLAGRAU').asInteger) +
                                                       ';0; ';

   mskConta.text      := frmSaldosPesquisaMT.cdsSaldos.FieldByName('PLACONTA').asString;
   lblPeriodo.caption := frmSaldosPesquisaMT.cdsPeriodo.FieldByName('PERNOME').asString +
                         '/' + frmSaldosPesquisaMT.dblkExercicio.text;

   AbreQuery;

end;



procedure TfrmLancSaldosMT.btnFiltraClick(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;



procedure TfrmLancSaldosMT.btnPlaClick(Sender: TObject);
begin
    if cdsLancamentos.IsEmpty then Exit;

   Application.CreateForm(TfrmLancaContabMT,frmLancaContabMT);
   frmLancaContabMT.FormStyle := FsNormal;
   frmLancaContabMT.Visible   := False;

   frmLancaContabMT.bVeioDaConsultaSaldo := True;
   frmLancaContabMT.dPlnDaConsultaSaldo  := cdsLancamentos.FieldByName('PLNCODIGO').asFloat;

    frmLancaContabMT.Position := poScreenCenter;
    frmLancaContabMT.bbtnConfirmar.ModalResult := mrNone;
    frmLancaContabMT.bbtnSair.ModalResult    := mrCancel;
    frmLancaContabMT.bbtnCancelar.ModalResult := mrNone;

   frmLancaContabMT.ShowModal;
   //-------------------------------------------------------------------------------------
   frmLancaContabMT.Release;
   //-------------------------------------------------------------------------------------

end;

procedure TfrmLancSaldosMT.bbtnSairClick(Sender: TObject);
begin
  if frmLancaContabMT <> nil then
  begin
     frmLancaContabMT.bVeioDaConsultaSaldo := False;
  end;

  inherited;

end;

end.
