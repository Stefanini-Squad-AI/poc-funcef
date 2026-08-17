{-------------------------------------------------------------------------------

                            CM Soluções Informática

                     CADASTRO DE DADOS COMPLEMENTARES  (MT)

Módulo       : AdminImob ( Administração Imobiliária )
Responsável  : Daniel Simões
Data Término : 00/00/2006

-------------------------------------------------------------------------------}
unit fCadDadosComplMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  ComCtrls, uCMTreeViewMT, DBCtrls, Mask, wwdbedit,

  uCtrlModuloImobiliario;

type
  TfrmCadDadosComplMT = class(TFrmCadastroMT)
    pnlArvore: TPanel;
    pnlDadosCompl: TPanel;
    Panel3: TPanel;
    LbLDadosComplemento: TLabel;
    treeDadosComplemento: TCMTreeViewMT;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    dbedCod: TwwDBEdit;
    dbedDescricao: TDBEdit;
    pnAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    DBrdgTipoDado: TDBRadioGroup;
    dbmOpcoes: TDBMemo;
    lblOpcoes: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    CtrlModuloImobiliario : TCtrlModuloImobiliario;
  public
    { Public declarations }
  end;

var
  frmCadDadosComplMT: TfrmCadDadosComplMT;

implementation

uses uSistema, uMensErro, uAutorizacao, DBaseDados, uCtrlParamIntegra, uString,
     uDataBase, FTrdxCCxContaMT;


{$R *.DFM}

procedure TfrmCadDadosComplMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlModuloImobiliario := CtrlModuloImobiliario.Create;
  CtrlModuloImobiliario.Initialize(dtmBaseDados.dbBaseDados,
                                   False,
                                   Sistema.ConnectionType,
                                   Sistema.ConnectionSide,
                                   Sistema.AppRemoteServer,
                                   True);
end;

end.
