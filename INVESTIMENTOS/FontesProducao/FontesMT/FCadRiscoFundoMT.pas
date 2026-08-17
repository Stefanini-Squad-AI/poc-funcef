unit FCadRiscoFundoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, wwdbedit, StdCtrls, Mask, Wwdotdot, Wwdbcomb, Menus,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, fcLabel, faMensagem, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  uCmSqlParams, DBaseDados, uMensErro, uCtrlFundos, uCtrlPadroes;

type
  TFrmCadRiscoFundoMT = class(TFrmCadastroGridMTInv)
    Label1: TLabel;
    dbcSiglaRisco: TwwDBComboBox;
    lblNome: TLabel;
    dbeNivelRisco: TwwDBEdit;
    CMSqlParams1: TCMSqlParams;
    CdsSIGLARISCOFUNDO: TStringField;
    CdsNOMERISCOFUNDO: TStringField;
    CdsIDRISCOFUNDOINVES: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    CtrlFundos : TCtrlFundos;

    procedure Seleciona(iIdRisco: Integer = -1; sSiglaRisco : String = '');

  public
    { Public declarations }
  end;

var
  FrmCadRiscoFundoMT: TFrmCadRiscoFundoMT;

implementation

{$R *.DFM}

{ TFrmCadRiscoFundoMT }

procedure TFrmCadRiscoFundoMT.Seleciona(iIdRisco: Integer;
  sSiglaRisco: String);
begin
  cds.Data := CtrlFundos.ListRiscoFundo(iIdRisco,sSiglaRisco);
end;

procedure TFrmCadRiscoFundoMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlFundos := TCtrlFundos.Create;
   CtrlFundos.InitializeAs(Padroes);
   CtrlFundos.CdsRiscoFundo := cds;
   Seleciona;
end;

procedure TFrmCadRiscoFundoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(dbcSiglaRisco.Text) = '' then
  begin
     MsgDlg('Informe o Código do Risco Ativo.', 'Warning', mtWarning, [mbOk], 0);
     if dbcSiglaRisco.CanFocus then
        dbcSiglaRisco.SetFocus;
     Exit;
  end;
  if Trim(dbeNivelRisco.Text) = '' then
  begin
     MsgDlg('Informe o Nível do Risco .', 'Warning', mtWarning, [mbOk], 0);
     if dbeNivelRisco.CanFocus then
        dbeNivelRisco.SetFocus;
     Exit;
  end;
  Accept := True;
end;


procedure TFrmCadRiscoFundoMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;

end;

procedure TFrmCadRiscoFundoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlFundos.GravaRiscoFundo;
  inherited;
   Seleciona;
end;

procedure TFrmCadRiscoFundoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlFundos);
end;

procedure TFrmCadRiscoFundoMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   if dbcSiglaRisco.CanFocus then
      dbcSiglaRisco.SetFocus;
end;

procedure TFrmCadRiscoFundoMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;                                                           
   if dbcSiglaRisco.CanFocus then
      dbcSiglaRisco.SetFocus;
end;

procedure TFrmCadRiscoFundoMT.FormShow(Sender: TObject);
begin
  inherited;
   Seleciona;
end;

procedure TFrmCadRiscoFundoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      cds.Locate('IDRISCOFUNDOINVES',MontaSelect.ValoresChave[0],[]);

end;

end.
