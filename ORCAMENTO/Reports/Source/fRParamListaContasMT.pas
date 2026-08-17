unit fRParamListaContasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, Wwdatsrc, ComCtrls, CMTree, Mask,
  mPlanoOrcamentarioMT, wwdblook;

type
  TfrmRParamListaContasMT = class(TfrmParamReports_Padrao)
    lblGrupo: TLabel;
    rdgOrdenacao: TRadioGroup;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    dsGrupo: TwwDataSource;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    cdsGrupoIDGRUPOORCAMEN: TFloatField;
    cdsGrupoNOMEGRUPOORCAMEN: TStringField;
    cdsGrupoFLGANALSINT: TStringField;
    cdsGrupoCODGRUPOORC: TStringField;
    cboGrupoOrcamen: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamListaContasMT: TfrmRParamListaContasMT;

implementation

uses UModulo;

{$R *.DFM}

procedure TfrmRParamListaContasMT.FormCreate(Sender: TObject);
begin
  inherited;

  with molPlanoOrcamentario,sqlPlanoOrcamen do
  begin
     Prepare;
     Open;
  end;

  with sqlGrupo do begin
    cdsGrupo.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;

end;

procedure TfrmRParamListaContasMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if cboGrupoOrcamen.LookupValue <> '' then
      Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(cboGrupoOrcamen.LookupValue);

  Cmp_Padrao.ParamValues[1].AsInteger := rdgOrdenacao.ItemIndex;
  Cmp_Padrao.ParamValues[2].AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);

end;

procedure TfrmRParamListaContasMT.molPlanoOrcamentariocboPlanoOrcamenExit(
  Sender: TObject);
begin
  cdsGrupo.Close;

  with sqlGrupo do begin
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;

  inherited;
end;

end.
