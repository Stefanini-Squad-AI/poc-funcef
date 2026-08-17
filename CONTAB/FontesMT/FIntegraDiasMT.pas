unit FIntegraDiasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient, Mask, wwdbdatetimepicker,
  CMDateTimePicker, CheckLst, uCtrlContab, Grids, Wwdbigrd, Wwdbgrid,
  uCtrlPeriodo, uCtrlLancamento, uCtrlProcessaContab, Provider, DBTables,
  Wwquery, uCmControlObject, uCMClientDataSet;

type
  TfrmIntegraDiasMT = class(TfrmSairAjuda)
    btnIntegrar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    pgrIntegracao: TProgressBar;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    Label14: TLabel;
    edDataProc: TCMDateTimePicker;
    dbchkbloqint: TCheckBox;
    Bevel1: TBevel;
    mskConta: TMaskEdit;
    Label2: TLabel;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    clbModulo: TCheckListBox;
    cdsModulo: TClientDataSet;
    Anim: TAnimate;
    procedure btnIntegrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
  private
    { Private declarations }
    Periodo    : TCtrlPeriodo;
    Lancamento : TCtrlLancamento;
    ProcessaContab : TCtrlProcessaContab;
    Contab         : TCtrlContab;

    Procedure MensProcessaContab(msg : String);
  public
    { Public declarations }
  end;

var
  frmIntegraDiasMT: TfrmIntegraDiasMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados, uCMTypes;


procedure TfrmIntegraDiasMT.btnIntegrarClick(Sender: TObject);
var bError : Boolean;
    sCodModulo, sModulos : String;
    i : Integer;
begin
   inherited;

   Periodo.Exercicio := StrToIntDef(dblkExercicio.LookUpValue,0);
   Periodo.Periodo   := StrToIntDef(dblkPeriodo.LookUpValue,0);
   if not Periodo.ValidaExercicio then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;
   if not Periodo.ValidaPeriodo then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;
   if not Periodo.TestaPeriodoxData(Sistema.idEmpresa,Periodo.Periodo,Periodo.Exercicio,edDataProc.Text) then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      edDataProc.SetFocus;
      Exit;
   end;
   btnIntegrar.Enabled := False;
   mskConta.EditMask := Contab.MascaraContaParam + ';0; ';
   mskConta.Visible  := True;
   sModulos := '';
   pgrIntegracao.max := clbModulo.Items.Count;
   pgrIntegracao.Position := 0;
   for i := 0 to clbModulo.Items.Count - 1 do begin
      pgrIntegracao.Position := pgrIntegracao.Position +1;
      if clbModulo.Checked[i] then begin
         sCodModulo := Copy(clbModulo.Items.Strings[i],1,(Pos('-',clbModulo.Items.Strings[i])-2));
         if sModulos = '' then
            sModulos := sCodModulo
         else
            sModulos := sModulos+','+sCodModulo;
      end;
   end;
   //
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
     
   End;
   pgrIntegracao.Position := 0;
   bError := false;
   if not ProcessaContab.ProcessaIntegraData(Sistema.idEmpresa,Sistema.idModulo,Sistema.idUsuario,Periodo.Exercicio,
           Periodo.Periodo,Sistema.UsaPlanoPatro,dbchkbloqint.Checked,edDataProc.Text,sModulos) then bError := true;
   if bError then begin
      MsgDlg('Integração NÃO efetuada. '+ProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end else begin
      MsgDlg('Integração efetuada com sucesso!','Aviso',mtWarning,[mbOk],0);
   end;
   btnIntegrar.Enabled := True;
   If Anim.Active Then Anim.Active := False;
end;

procedure TfrmIntegraDiasMT.FormActivate(Sender: TObject);
begin
   inherited;
   mskConta.Visible  := False;
   cdsModulo.First;
   while not cdsModulo.EOF do begin
      clbModulo.Items.Add(cdsModulo.FieldByName('IDMODULO').AsString+' - '+cdsModulo.FieldByName('NOMEMODULO').AsString);
      cdsModulo.Next;
   end;
end;

procedure TfrmIntegraDiasMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio

  Periodo := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsExercicio.Data := Periodo.ListExercicios(Sistema.Idempresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.Idempresa,tbpNaoBloqInt,0,0);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,
                            MensProcessaContab);


  Lancamento := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                        Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsModulo.Data := Lancamento.ListModulos(True);

  Contab := TCtrlContab.Create;
  Contab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


  If Not Contab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(Contab.MessageInfo,'Erro',MtError,[mbOk],0);
end;

procedure TfrmIntegraDiasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  Lancamento.Free;
  ProcessaContab.Free;
  Contab.Free;
end;


procedure TfrmIntegraDiasMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;

procedure TfrmIntegraDiasMT.MensProcessaContab(msg: String);
begin
   pgrIntegracao.Max      := ProcessaContab.MaxProgresso;
   pgrIntegracao.Position := ProcessaContab._Progresso;
   mskConta.Text          := ProcessaContab.ContaMostra;
   Application.ProcessMessages;
end;


procedure TfrmIntegraDiasMT.dblkPeriodoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  edDataProc.Date    := CdsPeriodo.FieldByName('PERDATFIM').asDateTime;
  edDataProc.Enabled := true;
end;


procedure TfrmIntegraDiasMT.spdTodosClick(Sender: TObject);
var iMaxList : Integer;
begin
   inherited;
   for iMaxList := 0 to clbModulo.Items.count -1 do begin
      clbModulo.Checked[imaxList] := true;
   end;
end;

procedure TfrmIntegraDiasMT.spdInverterClick(Sender: TObject);
var iMaxList : Integer;
begin
   inherited;
   for iMaxList := 0 to clbModulo.Items.count -1 do begin
      clbModulo.Checked[imaxList] := not clbModulo.Checked[imaxList];
   end;
end;

end.
