{-------------------------------------------------------------------------------

                            CM Soluções Informática

                FORM DE ALTERAÇÃO DOS DADOS DA ÁRVORE DO FRAME

Pendência    : 23517 / 23518
Módulo       : ComunsImobiliario
Responsável  : Daniel Simões
Data Término : 10/01/2007

--------------------------------------------------------------------------------

********************************************************************************
******************** REGRAS DE INICIALIZAÇÃO DA FRAME **************************

* Este Form é chamado da frame 'MolArvoreCompl' e tem o objetivo de editar o
  conteúdo da árvore...

********************************************************************************
********************************************************************************

-------------------------------------------------------------------------------}

unit fAltCompl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  DBCtrls, uCmClientDataSet, uCmSqlParams, Db, Wwdatsrc, DBClient, TREdit;

type
  TfrmAltCompl = class(TfrmOkCancelar)
    pnlTexto: TPanel;
    pnlNumero: TPanel;
    pnlData: TPanel;
    dbData: TCMDateTimePicker;
    Panel1: TPanel;
    lblConteudo: TLabel;
    pnlLookup: TPanel;
    memDescricao: TMemo;
    cboxLookup: TComboBox;
    edNumero: TRealEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltCompl: TfrmAltCompl;

implementation

{$R *.DFM}

end.
