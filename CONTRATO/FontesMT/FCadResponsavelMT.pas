unit FCadResponsavelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn,
  uCtrlResponsavel, uCtrlPessoa, uCMTypes;

type
  TfrmCadResponsavelMT = class(TFrmPessoaMT)
    tbsResponsavel: TTabSheet;
    plnRespon: TPanel;
    chkAtivoFixo: TDBCheckBox;
    chkContrato: TDBCheckBox;
    chkProjeto: TDBCheckBox;
    plnCapBem: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;
  end;

var
  frmCadResponsavelMT: TfrmCadResponsavelMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadResponsavelMT.FormCreate(Sender: TObject);
begin
   Pessoa:=TCtrlResponsavel.Create;
   Pessoa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,True,nil,nil,False);
   Pessoa.SubTipo:=stResponsavel;
   Pessoa.TipoPessoa:=tpFisica;
   inherited;
end;

procedure TfrmCadResponsavelMT.SelSubTipo(rIdPessoa: Double);
begin
   inherited;
   CdsSubTipo.Data:=TCtrlResponsavel(Pessoa).ListResponsavel(rIdPessoa);
end;

procedure TfrmCadResponsavelMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   CdsSubTipo.FieldByName('FLGATIVOFIXO').AsFloat:=1;
   CdsSubTipo.FieldByName('FLGCONTRATO').AsFloat:=0;
   CdsSubTipo.FieldByName('FLGPROJETO').AsFloat:=0;   
end;

end.
