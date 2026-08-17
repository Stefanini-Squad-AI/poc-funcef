unit FCadPlanPrevContabPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, Db, StdCtrls, wwdblook, MontaSelect, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, uCtrlPlanPrevContabPatro, uCmControlObject, uCMTypes,
  Provider, Mask, DBCtrls,  dBaseDados, uSistema, uMensErro, uMidasUtil, uCtrlPatro,
  UCtrlPlanPrevContabil, DBTables, Wwquery, CMDBLookupCombo;


type
  TFrmCadPlanPrevContabPatro = class(TFrmCadastroGridMT)
    Label2: TLabel;
    dbCboPlano: TwwDBLookupCombo;
    CdsPlano: TCMClientDataSet;
    CdsPlanoNOME: TStringField;
    CdsPlanoIDPLANOPREV: TFloatField;
    Label1: TLabel;
    CmbPatro: TCMDBLookupCombo;
    CdsPatro: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlPlanPrev            : TCtrlPlanPrevContabil;
    CtrlPatro               : TCtrlPatro;

    procedure Mensagem(sMensagem : String);

    procedure FazerRefresh;
  public
    { Public declarations }

  end;

var
  FrmCadPlanPrevContabPatro: TFrmCadPlanPrevContabPatro;

implementation

{$R *.DFM}



procedure TFrmCadPlanPrevContabPatro.FormCreate(Sender: TObject);
begin
   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true);

   CtrlPlanPrevContabPatro.cds := cds;

   CtrlPatro                   := TCtrlPatro.Create;
   CtrlPlanPrev                := TCtrlPlanPrevContabil.Create;

   CtrlPatro.InitializeAs (CtrlPlanPrevContabPatro);
   CtrlPlanPrev.InitializeAs (CtrlPlanPrevContabPatro);

   cdsPatro.Data := CtrlPatro.ListaPatroParaOrcamento(0,0);
   cdsPlano.Data := CtrlPlanPrev.ListaPlanPrevContabil;

   FazerRefresh;
   inherited;
end;



procedure TFrmCadPlanPrevContabPatro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlPatro.Free;
   CtrlPlanPrev.Free;
   CtrlPlanPrevContabPatro.Free;
   inherited;
end;



procedure TFrmCadPlanPrevContabPatro.CmeCadastroEdit(Sender: TObject);
begin
   Cds.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1, -1, Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger);
   inherited;
end;



procedure TFrmCadPlanPrevContabPatro.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;
   Cds.IndexFieldNames := AFieldName;
end;



procedure TFrmCadPlanPrevContabPatro.FazerRefresh;
begin
  { o inherited deste método deve estar sempre no final da instrução }
  dbGrd.BringToFront;
  pnlControles.SendToBack;
  if (not Cds.IsEmpty) then
     if CmeCadastro.Operacao in [OpIdle, OpVazio] then begin
       CmeCadastro.Operacao := OpIdle;
       CmeCadastro.AtualizaBotoes (self);
     end;
  cds.Close;
  cds.Data                    := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1, -1, -1);
end;



procedure TFrmCadPlanPrevContabPatro.CmeCadastroDelete(Sender: TObject);
begin
   inherited;
   FazerRefresh;
end;



procedure TFrmCadPlanPrevContabPatro.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao = OpInserir then
     CmeCadastro.Operacao := opIdle;
  FazerRefresh;   
end;



procedure TFrmCadPlanPrevContabPatro.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if (Cds.State = dsbrowse) then Cds.Edit;

   //24/08/2005
   Accept := CtrlPlanPrevContabPatro.Gravar;
   if not accept then Mensagem ( CtrlPlanPrevContabPatro.MessageInfo);
end;



procedure TFrmCadPlanPrevContabPatro.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.Close;
   Cds.CreateDataSet;
end;



procedure TFrmCadPlanPrevContabPatro.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlPlanPrevContabPatro.Gravar;
end;



procedure TFrmCadPlanPrevContabPatro.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     cds.Data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1, -1, StrToInt(MontaSelect.ValoresChave[0]));
     dbGrd.SendToBack;
  end;
end;



procedure TFrmCadPlanPrevContabPatro.Mensagem(sMensagem: String);
begin
    MsgDlg(sMensagem,'Global CM',mtError,[mbOK],0);
end;


procedure TFrmCadPlanPrevContabPatro.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  FazerRefresh; // 25/08/05
end;

end.
