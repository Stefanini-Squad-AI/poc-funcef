unit fMTCadTerceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, CMProcura, StdCtrls,
  CheckLst, ComCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbspin, ExtCtrls, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, Mask,
  wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, uCtrlPadroes,
  uCmSqlParams, IvEMulti;

type
  TfrmMTCadTerceiro = class(TFrmPessoaMT)
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
  frmMTCadTerceiro: TfrmMTCadTerceiro;

implementation

{$R *.DFM}

uses uCtrlTerceiro, uCtrlPessoa, uSistema;

procedure TfrmMTCadTerceiro.FormCreate(Sender: TObject);
begin
   Pessoa := TCtrlTerceiro.Create;
   Pessoa.InitializeAs(Padroes);
   Pessoa.SaveModuloRespon := False;
   Pessoa.Subtipo          := stTerceiro;
   inherited;
end;

procedure TfrmMTCadTerceiro.SelSubTipo(rIdPessoa : Double);
begin
   inherited;
   cdsSubTipo.Data := TCtrlTerceiro(Pessoa).SelTerceiro(rIdPessoa, 0); // Bens Alugados de Terceiros
end;

procedure TfrmMTCadTerceiro.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   cdsSubTipo.FieldByName('TIPOTERCEIRO').AsInteger := 0;
end;

procedure TfrmMTCadTerceiro.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   cdsSubTipo.FieldByName('TIPOTERCEIRO').AsInteger := 0;
end;

end.
