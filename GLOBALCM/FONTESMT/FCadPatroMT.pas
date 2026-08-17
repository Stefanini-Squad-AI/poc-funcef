{==================================================================================================
Alterações:
===================================================================================================
Rotina    :
Data      : 26/08/2006
Autor     : Claudio Faria
Pendencia : 22217
Descrição : Criado Cadastro de Patrocinadora
---------------------------------------------------------------------------------------------------}

unit FCadPatroMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlPatrocinadora, fpessoaMT, Menus, Db, MontaSelect, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls,
  CMProcura, StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, uCtrlPadroes,
  uCMTypes;

type
  TfrmCadPatroMT = class(TFrmPessoaMT)
    dbeSPC: TDBEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CtrlPatro: TCtrlPatrocinadora;

  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;
  public
    { Public declarations }
  end;

var
  frmCadPatroMT: TfrmCadPatroMT;

implementation

Uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmCadPatroMT.FormCreate(Sender: TObject);
begin
   Pessoa := TCtrlPatrocinadora.Create;
   Pessoa.InitializeAs(Padroes);
   Pessoa.TipoPessoa      := tpJuridica;
   Pessoa.UsaPessoaFisica := False;
   Pessoa.SubTipo         := stPatro;

   inherited;
end;

procedure TfrmCadPatroMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  If Not TCtrlPatrocinadora(Pessoa).SelDadosPatro(Sistema.IdEmpresa, rIdPessoa, CdsSubTipo) Then
     Raise Exception.Create(Pessoa.MessageInfo);
end;


end.
