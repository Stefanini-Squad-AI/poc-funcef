unit fMTCadResponsavel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  Buttons, DBCtrls, CMProcura, StdCtrls, CheckLst, ComCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, ExtCtrls, uCMTypes,
  TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, TB97Ctls,
  wwdblook, CMDBLookupCombo, TB97Tlwn, fPessoaMT;

type
  TfrmMTCadResponsavel = class(TFrmPessoaMT)
    TabResponsavel: TTabSheet;
    plnRespon: TPanel;
    chkAtivoFixo: TDBCheckBox;
    chkContrato: TDBCheckBox;
    chkProjeto: TDBCheckBox;
    plnCapBem: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SelSubTipo(rIdPessoa : Double); Override;
  end;

var
  frmMTCadResponsavel: TfrmMTCadResponsavel;

implementation

{$R *.DFM}

uses dBaseDados, uCtrlPessoa, uCtrlResponsavel, uSistema;

procedure TfrmMTCadResponsavel.FormCreate(Sender: TObject);
begin
   Pessoa := TCtrlResponsavel.Create;
   Pessoa.Initialize(dtmBaseDados.dbBaseDados, True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer, True);
   Pessoa.Subtipo          := stResponsavel;
   Pessoa.TipoPessoa       := tpFisica;
   Pessoa.UsaPessoaFisica  := True;
   Pessoa.SaveModuloRespon := True;
   //-------------------------------------------------------------------------------------
   inherited;
end;

procedure TfrmMTCadResponsavel.SelSubTipo(rIdPessoa : Double);
begin
   inherited;
   cdsSubTipo.Data := TCtrlResponsavel(Pessoa).SelResponsavel(rIdPessoa);
end;

end.

