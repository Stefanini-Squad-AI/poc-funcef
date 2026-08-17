unit FExecBuscaPadraoContratos;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Pendência :
Autor     :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : MontaFiltro
Data      : 13/07/2004
Pendência :
Autor     : André Pontes
Descrição : correção da busca por matrícula da ElegPatro para matrícula da DepenTit
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMTEP, StdCtrls, wwdblook, mListaPlano, mListaPatro,
  mContratoEmptmo, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmExecBuscaPadraoContratos = class(TfrmWizardMTEP)
    molContratoEmptmo: TmolContratoEmptmo;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;
    Label1: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContrato: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    DBcboSitPart: TwwDBLookupCombo;
    DBgrdHistMov: TwwDBGrid;
    Panel2: TPanel;
    btnInverteSelecao: TBitBtn;
    btnMarcaTodos: TBitBtn;
    chkTodos: TCheckBox;
    bbtnParcela: TBitBtn;
    bbtnEncargos: TBitBtn;
    qryContratos: TwwQuery;
    dsContratos: TwwDataSource;
    updContratos: TUpdateSQL;
    qryContratosFLGESCOLHA: TFloatField;
    qryContratosIDCONTRATOEMPTMO: TFloatField;
    qryContratosNOME: TStringField;
    qryContratosTCEDESCRICAO: TStringField;
    qryContratosDATACREDITO: TDateTimeField;
    qry: TwwQuery;

    procedure btnContinuarClick(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }

    function MontaSqlContratos    : String;  virtual; abstract;
    function GeraContratosSelecao : Boolean; virtual; abstract;


  end;




var
  frmExecBuscaPadraoContratos: TfrmExecBuscaPadraoContratos;





implementation
{$R *.DFM}
uses
  UFuncoesEmptmo;





procedure TfrmExecBuscaPadraoContratos.btnContinuarClick(Sender: TObject);
begin
   inherited;

   case pgcControle.ActivePageIndex of

      0 : begin
             LimpaParametros(qry);
             pgcControle.ActivePageIndex := pgcControle.ActivePageIndex + 1;
          end;

      1 : begin
             qry.Sql.Text := MontaSqlContratos;
             GeraContratosSelecao;
          end;

   end;

end;



end.
