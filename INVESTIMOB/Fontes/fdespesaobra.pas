unit FDespesaObra;

//	------------------------------------------------------------------------------------------------
//
//	Despesas de Obra
//
//	Autor          :  André Pontes
//	Data de Início	:
//	Data de Término:
//
//	Modificações	:
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, ComCtrls, wwriched, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, TREdit, CmEventosCadastro, ImgList, wwdblook, TREdit, ComCtrls, wwriched;

type
  TfrmDespesasObra = class(TfrmCadastroCS)
    Label25: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    DBedtValorOM: TDBRealEdit;
    DBcboMoeda: TwwDBLookupCombo;
    DBedtDataOper: TCMDateTimePicker;
    DBcboImovel: TwwDBLookupCombo;
    btnBuscaImovel: TBitBtn;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label2: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label3: TLabel;
    DBmemContrato: TwwDBRichEdit;

  private { Private declarations }

  public { Public declarations }

  end;



var
  frmDespesasObra: TfrmDespesasObra;



implementation
{$R *.DFM}



end.
