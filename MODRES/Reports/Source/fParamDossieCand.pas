unit fParamDossieCand;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  StdCtrls, ExtCtrls, wwdblook, Db, DBClient, uCMClientDataSet, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, uCtrlPessoaCandidato, fParamReports_Padrao, CmParamReport;

type
  TfrmParamDossieCand = class(TfrmParamReports_Padrao)
    CdsCandidato: TCMClientDataSet;
    dblckCandidato: TwwDBLookupCombo;
    rgImprimirOBS: TRadioGroup;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblckCandidatoChange(Sender: TObject);
  private
    CtrlPessoaCandidato: TCtrlPessoaCandidato;

    procedure HabilitarBtOk;
  end;

var
  frmParamDossieCand: TfrmParamDossieCand;

implementation

uses uSistema, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamDossieCand.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  CdsCandidato.Data := CtrlPessoaCandidato.ListCandidatoPessoa(0, '  P.IDPESSOA, P.NOME');

  HabilitarBtOk;
end;

procedure TfrmParamDossieCand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaCandidato);
  inherited;
end;

procedure TfrmParamDossieCand.dblckCandidatoChange(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmParamDossieCand.bbtnConfirmarClick(Sender: TObject);
begin
  Cmp_Padrao.ParamByName('IdCandidato').asFloat := CdsCandidato.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('ImprimirOBS').asBoolean := (rgImprimirOBS.ItemIndex = 0);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmParamDossieCand.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled := (dblckCandidato.Text <> '');
end;

end.
