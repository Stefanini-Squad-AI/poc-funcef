unit fMTCadDestinatBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, CMProcura, StdCtrls,
  CheckLst, ComCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbspin, ExtCtrls, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, Mask,
  wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn;

type
  TfrmMTCadDestinatBaixa = class(TFrmPessoaMT)
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SelSubTipo(rIdPessoa : Double); Override;
  end;

var
  frmMTCadDestinatBaixa: TfrmMTCadDestinatBaixa;

implementation

{$R *.DFM}

uses dBaseDados, uCtrlTerceiro, uCtrlPessoa, uSistema;

procedure TfrmMTCadDestinatBaixa.FormCreate(Sender: TObject);
begin
   Pessoa := TCtrlTerceiro.Create;
   Pessoa.Initialize(dtmBaseDados.dbBaseDados, True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer, True);
   Pessoa.SaveModuloRespon := True;
   Pessoa.Subtipo          := stTerceiro;
   Pessoa.MudaCaption      := False;
   Pessoa.FormCaption      := 'Destinatários de Bens Baixados';
   inherited;
end;

procedure TfrmMTCadDestinatBaixa.SelSubTipo(rIdPessoa : Double);
begin
   inherited;
   cdsSubTipo.Data := TCtrlTerceiro(Pessoa).SelTerceiro(rIdPessoa, 1); // Destinatários de Bens Baixados
end;

procedure TfrmMTCadDestinatBaixa.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   cdsSubTipo.FieldByName('TIPOTERCEIRO').AsInteger := 1;
end;

procedure TfrmMTCadDestinatBaixa.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   cdsSubTipo.FieldByName('TIPOTERCEIRO').AsInteger := 1;
end;

end.
