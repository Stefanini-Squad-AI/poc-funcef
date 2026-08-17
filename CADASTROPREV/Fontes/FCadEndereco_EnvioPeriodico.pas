unit FCadEndereco_EnvioPeriodico;

//Alterações
// Autor(a)    : Ricardo de Freitas Araújo
// Data        : 06/04/2011
// Pendência   : SOL 148338 Kintana 1050257
// Rotina      : Formulario
// Alteração   : Criação do formulário.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Mask, DBCtrls;

type
  TFrm_CadEndereco_EnvioPeriodico = class(TForm)
    lbl1: TLabel;
    dbedtLOGRADOURO: TDBEdit;
    ds_Inco: TDataSource;
    lbl2: TLabel;
    dbedtBAIRRO: TDBEdit;
    lbl3: TLabel;
    dbedtCIDADE: TDBEdit;
    lbl4: TLabel;
    dbedtCEP: TDBEdit;
    lbl5: TLabel;
    dbedtUF: TDBEdit;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    dbtxtIDPESSOA: TDBText;
    dbtxtIDENDERECO: TDBText;
    lbl6: TLabel;
    lbl7: TLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadEndereco_EnvioPeriodico: TFrm_CadEndereco_EnvioPeriodico;

implementation

uses fEnvioPeriodico;

{$R *.DFM}

procedure TFrm_CadEndereco_EnvioPeriodico.btnConfirmarClick(Sender: TObject);
begin
  //Ricardo SOL 148338 Kintana 1050257
 if not frmEnvioPeriodico.Atualizar_Endereco then
 begin
      frmEnvioPeriodico.cdsIncons.Cancel();
 end
 else
      frmEnvioPeriodico.cdsIncons.Post();

 Frm_CadEndereco_EnvioPeriodico.Close;

end;

procedure TFrm_CadEndereco_EnvioPeriodico.btnCancelarClick(
  Sender: TObject);
begin
     frmEnvioPeriodico.cdsIncons.Cancel();
     Frm_CadEndereco_EnvioPeriodico.Close;
end;

end.
