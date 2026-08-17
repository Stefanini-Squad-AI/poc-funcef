//******************************************************************************
// Data      : 23/10/2007
// Código    : AL_1
// Pendencia : 25945
// SOL       :
// Desc      : Acertando a exclusão quando só existia um registro
//******************************************************************************
unit FCadProvPerdaRVMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams,

  uMensErro, uSistema, uCMTypes, DBaseDados, Mask, uCtrlInvestimento, uCtrlRendaVariavel, uCtrlPadroes,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, wwdblook, CMDBLookupCombo;


type
  TfrmCadProvPerdaRVMT = class(TFrmCadastroGridMTInv)
    sqlpProvPerda: TCMSqlParams;
    cdsInvestimentos: TCMClientDataSet;
    dblInvestimento: TCMDBLookupCombo;
    CdsDESCINVESTIMENTO: TStringField;
    CdsDATAVIGENCIA: TDateTimeField;
    CdsPERCENTUAL: TFloatField;
    CdsIDPROVPERDARV: TFloatField;
    CdsIDINVESTIMENTO: TFloatField;
    Label1: TLabel;
    CMSqlParams2: TCMSqlParams;
    dtpDataVigencia: TCMDateTimePicker;
    Label2: TLabel;
    dbrPercentual: TDBRealEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
    iInvestimento: Integer;
    dDataVigencia: TDateTime;
    sInv: String;
    fPerc: Double;
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    procedure Seleciona(iInvestimento: Integer = -1; dDataVigencia: TDateTime = 0; bMaior: Boolean = False);

  public
    { Public declarations }
  end;

var
  frmCadProvPerdaRVMT: TfrmCadProvPerdaRVMT;

implementation

uses URendaVariavel;

{$R *.DFM}

{ TfrmCadProvPerdaRV }

procedure TfrmCadProvPerdaRVMT.Seleciona(iInvestimento: Integer = -1; dDataVigencia: TDateTime = 0; bMaior: Boolean = False);
begin
  cds.Data := CtrlRendaVariavel.ListProvPerda(iInvestimento, dDataVigencia, bMaior);
end;


procedure TfrmCadProvPerdaRVMT.FormCreate(Sender: TObject);
begin
   // É necessário abrir o Cds antes da herança, na herança o sistema
   // verifica se o Cds tem registro para habilitar as ações (Exclusão especificamente)
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlInvestimento.InitializeAs(Padroes);

   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);
   CtrlRendaVariavel.CdsProvPerda := cds;

   cdsInvestimentos.Data       := CtrlInvestimento.ListInvestimento(-1, 2);
   Seleciona;

   inherited;
end;

procedure TfrmCadProvPerdaRVMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
end;

procedure TfrmCadProvPerdaRVMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   try
      Cds.DisableControls;

      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      // AL_1
      If CmeCadastro.Operacao in [opInserir] then
      begin   // Fim AL_1
         iInvestimento := Cds.FieldByName('IDINVESTIMENTO').AsInteger;
         dDataVigencia := Cds.FieldByName('DATAVIGENCIA').AsDateTime;
         sInv := Cds.FieldByName('DESCINVESTIMENTO').AsString;
         fPerc := Cds.FieldByName('PERCENTUAL').AsFloat;
      end;

      Accept := CtrlRendaVariavel.AplicaAtualProvPerda;
      if not Accept then
         MsgDlg('Não foi possível efetuar a operação.' + #13 +
                'Motivo: ' + CtrlRendaVariavel.MessageInfo,'Mensagem do Sistema', mtWarning, [mbOk], 0)
      else
      begin
         Accept := RendaVariavel.MarcarFlagReproc(iInvestimento,-1, -1, dDataVigencia, False, True, False);
         if not Accept then
            MsgDlg('Não foi possível efetuar a operação.' + #13 +
                   'Motivo: Não foi possível marcar o investimento para reprocessamento','Mensagem do Sistema', mtWarning, [mbOk], 0)
      end;

      if Accept then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
      end
      else
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
      end;

      inherited;

      Seleciona;

      if not Accept then
      begin
         // Se for Insert
         if Self.Tag = 1 then
         begin
            Cds.Insert;
            dblInvestimento.Text := sInv;
            dblInvestimento.PerformSearch;
            dtpDataVigencia.Text := DateToStr(dDataVigencia);
            dbrPercentual.Value := fPerc;
         end
         else
         // Se for Alteração
         if Self.Tag = 2 then
         begin
            if Cds.Locate('IDINVESTIMENTO;DATAVIGENCIA', VarArrayOf([iInvestimento, dDataVigencia]), []) then
               Cds.Edit;
         end;
      end;
      iInvestimento := 0;
      dDataVigencia := 0;
   finally
      Cds.EnableControls;
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Rollback;
   end;
end;

procedure TfrmCadProvPerdaRVMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDINVESTIMENTO;DATAVIGENCIA',VarArrayOf([MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[1]]), []);
end;

procedure TfrmCadProvPerdaRVMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := True;
  if CmeCadastro.Operacao in [OpInserir,OpAlterar] then;
  begin
     if Trim(dblInvestimento.Text) = '' then
     begin
        MsgDlg('Investimento não Informado','Mensagem do Sistema' ,MtWarning,[mbok],0);
        if dblInvestimento.CanFocus then
           dblInvestimento.SetFocus;
        Accept := False;
     end
     else if Trim(dtpDataVigencia.Text) = '' then
     begin
        MsgDlg('Data de Vigência não Informada','Mensagem de Sistema' ,MtWarning,[mbok],0);
        if dtpDataVigencia.CanFocus then
           dtpDataVigencia.SetFocus;
        Accept := False;
     end
     else if dbrPercentual.Value = 0 then
     begin
        MsgDlg('Percentual não Informado','Mensagem de Sistema' ,MtWarning,[mbok],0);
        if dbrPercentual.CanFocus then
           dbrPercentual.SetFocus;
        Accept := False;
     end
     else if dbrPercentual.Value > 100 then
     begin
        MsgDlg('O Percentual Informado não pode ser maior que 100(Cem)','Mensagem de Sistema' ,MtWarning,[mbok],0);
        if dbrPercentual.CanFocus then
           dbrPercentual.SetFocus;
        Accept := False;
     end;
  end;
end;

procedure TfrmCadProvPerdaRVMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   inherited;
end;

procedure TfrmCadProvPerdaRVMT.sbtnApagarClick(Sender: TObject);
begin
   iInvestimento := Cds.FieldByName('IDINVESTIMENTO').AsInteger;
   dDataVigencia := Cds.FieldByName('DATAVIGENCIA').AsDateTime;
   sInv := Cds.FieldByName('DESCINVESTIMENTO').AsString;
   fPerc := Cds.FieldByName('PERCENTUAL').AsFloat;
   // 1 = Incluir, 2 = Alterar, 3 = Excluir
   Self.Tag := 3;
   inherited;
end;

procedure TfrmCadProvPerdaRVMT.sbtnAlterarClick(Sender: TObject);
begin
   iInvestimento := Cds.FieldByName('IDINVESTIMENTO').AsInteger;
   dDataVigencia := Cds.FieldByName('DATAVIGENCIA').AsDateTime;
   sInv := Cds.FieldByName('DESCINVESTIMENTO').AsString;
   fPerc := Cds.FieldByName('PERCENTUAL').AsFloat;
   // 1 = Incluir, 2 = Alterar, 3 = Excluir
   Self.Tag := 2;
   inherited;
end;

procedure TfrmCadProvPerdaRVMT.sbtnInserirClick(Sender: TObject);
begin
   iInvestimento := 0;
   dDataVigencia := 0;
   sInv := '';
   fPerc := 0;
   // 1 = Incluir, 2 = Alterar, 3 = Excluir
   Self.Tag := 1;
   inherited;
end;

end.
