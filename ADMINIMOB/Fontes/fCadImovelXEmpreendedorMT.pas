{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadImovelXEmpreendedorMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, uCtrlImovelXProp,
  FCadastroGridMT, uMensErro, dBaseDados, uSistema, uCMTypes,
  uComunsImobiliario, uVerificaPreenchimento, mImovelMestre, Mask, DBCtrls,
  wwdblook, uCmSqlParams;

type
  TFrmCadImovelXEmpreendedorMT = class(TfrmCadastroGridMTImob)
    Label2: TLabel;
    dbCboEmpreendedor: TwwDBLookupCombo;
    Label4: TLabel;
    DBedtValor: TDBEdit;
    CdsEmpreendedor: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    CdsEmpreendedorIDPESSOA: TFloatField;
    CdsEmpreendedorNOME: TStringField;
    CdsIDIMOVEL: TFloatField;
    CdsIDPROPRIETARIOUH: TFloatField;
    CdsPERCENTUAL: TFloatField;
    CdsNOME: TStringField;
    Panel1: TPanel;
    molImovelMestre1: TmolImovelMestre;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure molImovelMestre1btnBuscaImovelClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);

  protected
    procedure FazerRefresh; override;

  private
    CtrlImovelXProp : TCtrlImovelXProp;

    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
  end;

var
  FrmCadImovelXEmpreendedorMT: TFrmCadImovelXEmpreendedorMT;

implementation

{$R *.DFM}

procedure TFrmCadImovelXEmpreendedorMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImovelXProp := TCtrlImovelXProp.Create;
  CtrlImovelXProp.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                              ComunsImobiliario.MensErroMT);

  CtrlImovelXProp.CdsImovelXProp := Cds;

  // Seleciona os Empreendedores cadastrados
  CdsEmpreendedor.Data := CtrlImovelXProp.SelecionaEmpreendedores;
end;

procedure TFrmCadImovelXEmpreendedorMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlImovelXProp);
  inherited;
end;

procedure TFrmCadImovelXEmpreendedorMT.FazerRefresh;
begin
  Cds.Data := CtrlImovelXProp.SelecionaImovelXProp(molImovelMestre1.iMestre);

  // quando é alteração estes botões estão desabilidados
  molImovelMestre1.btnBuscaImovel.Enabled := true;
  dbCboEmpreendedor.Enabled := true;
  inherited;
end;

procedure TFrmCadImovelXEmpreendedorMT.CmeCadastroEdit(Sender: TObject);
begin
//  Cds.Data := CtrlImovelXProp.SelecionaImovelXProp(CdsIDIMOVEL.AsInteger);
  inherited;
  molImovelMestre1.btnBuscaImovel.Enabled := false;
  dbCboEmpreendedor.Enabled := false;
end;

procedure TFrmCadImovelXEmpreendedorMT.CmeCadastroApplyEdit(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlImovelXProp.GravaImovelXProp;
end;

procedure TFrmCadImovelXEmpreendedorMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // quando é alteração estes botões estão desabilidados
  molImovelMestre1.btnBuscaImovel.Enabled := true;
  dbCboEmpreendedor.Enabled := true;
end;

procedure TFrmCadImovelXEmpreendedorMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    molImovelMestre1.iMestre        := StrToInt(MontaSelect.ValoresChave[0]);
    molImovelMestre1.edtImovel.Text := MontaSelect.ValoresChave[4];

    FazerRefresh;
  end;
end;

procedure TFrmCadImovelXEmpreendedorMT.molImovelMestre1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelMestre1.btnBuscaImovelClick(Sender);

  if molImovelMestre1.iMestre > 0 then
    begin
      Cds.Data := CtrlImovelXProp.SelecionaImovelXProp(molImovelMestre1.iMestre);
    end;
end;

function TFrmCadImovelXEmpreendedorMT.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
     if molImovelMestre1.edtImovel.Text = '' then
       raise EValidacao.CreateVal('É necessário indicar o Imóvel Mestre!', molImovelMestre1.btnBuscaImovel );

     if dbCboEmpreendedor.LookupValue = '' then
       raise EValidacao.CreateVal('É necessário indicar o Empreendedor!', dbCboEmpreendedor );

     if dbEdtValor.Text = '' then
       raise EValidacao.CreateVal('É necessário indicar o Percentual!', dbEdtValor );

  except
    on ev : EValidacao do begin
       Screen.Cursor := crDefault;
       if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then ev.Control.SetFocus;
       Exit;
    end;
  end;
  Result := True;
end;

procedure TFrmCadImovelXEmpreendedorMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  CdsIDIMOVEL.AsInteger := molImovelMestre1.iMestre;

  try
    if Cds.FindKey([dbCboEmpreendedor.LookupValue]) then
  except
    on Exception do
      begin
        MsgDlg('Empreendedor já cadastrado!','Aviso',mtWarning,[mbOK],0);
        EXIT;
      end;
  end;

  Accept := VerificaPreenchimento;
end;

procedure TFrmCadImovelXEmpreendedorMT.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Insert;
end;

end.
