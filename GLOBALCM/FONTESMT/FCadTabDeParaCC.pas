unit FCadTabDeParaCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook;

type
  TfrmCadTabDeParaCC = class(TFrmCadastroMestreDetMT)
    cboTabela: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    cboPlano: TComboBox;
    Label3: TLabel;
    ComboBox1: TComboBox;
    cboConta: TComboBox;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTabDeParaCC: TfrmCadTabDeParaCC;

implementation

{$R *.DFM}

procedure TfrmCadTabDeParaCC.FormCreate(Sender: TObject);
begin
   inherited;
{
   // *** Instancia a classe principal ***
   CtrlTabelaDePara := TCtrlTabelaDePara.Create;
   CtrlTabelaDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

   CtrlTabelaDePara.cdsMestre := Cds;
   Cds.Data := CtrlTabelaDePara.ListTabelaDePara(-1,ttpCodigo);

   cdsTabelaRef.Data    := CtrlTabelaDePara.ListTabelaDePara(0,ttpNome);
   cdsTabelaContab.Data := CtrlTabelaDePara.ListTabelaContab;

   // *** Instancia a classe campoDePara ***
   CtrlCampoDePara := TCtrlCampoDePara.Create;
   CtrlCampoDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

   CtrlTabelaDePara.cdsDetalhe := CdsDet;
   CdsDet.Data := CtrlCampoDePara.ListCampoDePara(-1);
}
end;



end.
