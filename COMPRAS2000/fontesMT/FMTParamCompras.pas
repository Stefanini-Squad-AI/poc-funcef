{ --------------------------------------------------------------------------------------------------
Data      : 23.07.2007
Autor     : Marcus Oliveira
Pendencia : 25483
Descrição : Implementado o FLGACESSLANCDOC para ativar o relacionamendo Usuários x Centro de
            Responsabilidade no Lançamento do Caixa Pequeno.
{ --------------------------------------------------------------------------------------------------
Data      : 25.04.2007
Autor     : Antonio Marcos (amf)
Pendencia : ????
Descrição : Corrige o erro encontrado pelo suporte. Ao atualizar estava limpando a tela.
----------------------------------------------------------------------------------------------------
Data      : 02.04.2007
Autor     : Antonio Marcos (amf)
Pendencia : 24180
Descrição : Parâmetro para controle de crítica da data de emissão na compra avulsa.
----------------------------------------------------------------------------------------------------
Data      : 21.09.2006
Autor     : Antonio Marcos (amf)
Pendencia : 21409
Descrição : Permite seleção do centro de responsabilidade default
---------------------------------------------------------------------------------------------------}

{ DAVID - 17/07/2003 - Pendência 14524 - Incluída opção de Opções de Destino.}
unit FMTParamCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdblook, TREdit, Mask, uCtrlAlmoxCompra, uCmTypes, uCmSqlParams,
  uCtrlCentRespon, uCtrlPadroes;

type
  TFrmMTParamCompras = class(TFrmCadastroMT)
    Label9: TLabel;
    Label10: TLabel;
    GrpOC: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edAssinat1: TDBEdit;
    edAssinat2: TDBEdit;
    edAssinat3: TDBEdit;
    memObs: TDBMemo;
    chkImpAparte: TDBCheckBox;
    chkOrcamento: TDBCheckBox;
    chkCompraAlem: TDBCheckBox;
    chkImpLogo: TDBCheckBox;
    chkTrasObs: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edPreco: TDBRealEdit;
    edPrazoEnt: TDBRealEdit;
    edAvaliForn: TDBRealEdit;
    edPrazoPag: TDBRealEdit;
    edTaxaJur: TDBRealEdit;
    chkOBSCIOC: TDBCheckBox;
    dbclTipoDocumento: TwwDBLookupCombo;
    RgImOC: TDBRadioGroup;
    chkVerifRAD: TDBCheckBox;
    cdsTipoDoc: TCMClientDataSet;
    DBRadioGroup1: TDBRadioGroup;
    DBRealEdit1: TDBRealEdit;
    Label11: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label12: TLabel;
    cdsCentRespon: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    chkCriticaEmissao: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    AlmoxCompra : TCtrlAlmoxCompra;
    CentRespon: TCtrlCentRespon;

  public
    { Public declarations }
  end;

var
  FrmMTParamCompras: TFrmMTParamCompras;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTParamCompras.FormCreate(Sender: TObject);
begin
  inherited;
  AlmoxCompra := TCtrlAlmoxCompra.Create;
  AlmoxCompra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  AlmoxCompra.Cds   := Cds;

  Cds.Data           := AlmoxCompra.GetParamCompras(Sistema.IdEmpresa);
  cdsTipoDoc.Data    := AlmoxCompra.ListTipoDoc;

  CentRespon         := TCtrlCentRespon.Create;
  CentRespon.InitializeAs(Padroes);

  cdsCentRespon.Data := CentRespon.ListaCentRespon(Sistema.IdEmpresa,
                                                   '',
                                                   0,
                                                   'A',
                                                   0,
                                                   True,
                                                   True);
end;

procedure TFrmMTParamCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AlmoxCompra.Free;

  CentRespon.Free;
end;

procedure TFrmMTParamCompras.CmeCadastroInsert(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
   If (Not Cds.IsEmpty) Then
     Begin
        Cds.Cancel;

        Cds.Data  := AlmoxCompra.GetParamCompras(Sistema.IdEmpresa);

        Cds.Edit;
     End
   Else
   begin
      Cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      Cds.FieldByName('OPDESTINO').AsString := 'A';
      Cds.FieldByName('FLGMARGEMOC').AsFloat:= 0;
   end;
end;

procedure TFrmMTParamCompras.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Cds.Data := AlmoxCompra.GetParamCompras(Sistema.IdEmpresa);
end;

procedure TFrmMTParamCompras.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := AlmoxCompra.GravaParamCompras;
end;

procedure TFrmMTParamCompras.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := AlmoxCompra.GravaParamCompras;
end;

procedure TFrmMTParamCompras.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( AlmoxCompra.MessageInfo,'Erro',mtError,[mbOk],0);
end;

end.
