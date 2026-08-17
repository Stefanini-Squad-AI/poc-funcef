unit fCadHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker, uCtrlPessoaHotel,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn;

type
  TfrmCadHotel = class(TFrmPessoaMT)
    Label2: TLabel;
    dbedEstrelas: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlPessoaHotel: TCtrlPessoaHotel;
    procedure SelSubtipo(IdPessoa: double); override;
  public
    { Public declarations }
  end;

var
  frmCadHotel: TfrmCadHotel;

implementation

uses uCMTypes, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadHotel.FormCreate(Sender: TObject);
begin
  CtrlPessoaHotel := TCtrlPessoaHotel.Create;
  CtrlPessoaHotel.InitializeAs(Padroes);

  Pessoa := TCtrlPessoaHotel.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stHotel;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;
  Pessoa.ObrigaDocumento := false;
  inherited;
end;

procedure TfrmCadHotel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlPessoaHotel);
  inherited;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadHotel.SelSubtipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaHotel(Pessoa).SelHotel(IdPessoa);
end;

end.
