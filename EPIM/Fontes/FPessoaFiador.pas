unit FPessoaFiador;

//	------------------------------------------------------------------------------------------------
//
//	Cadastro de Locatários de Imóveis
//
//	Autor             :	André Pontes
//	Data de Início    :	03/03/1999
//	Data de Término   :	03/03/1999
//
//	Modificações      :
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97, StdCtrls, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, checklst, ExtCtrls,
  TabControlDetalhe, wwdblook, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdotdot, Wwdbcomb, TREdit;

type
  TfrmPessoaFiador = class(TfrmPessoa)
    qrySubTipoIDAVALISTA: TFloatField;
    wwDBComboBox1: TwwDBComboBox;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    tbsAvalista: TTabSheet;
    qrySubTipoORIGEMREND: TStringField;
    qrySubTipoRENDACOMP: TFloatField;
    qrySubTipoMARGEMCONSIG: TFloatField;
    Label2: TLabel;
    dbEdOrigRend: TDBEdit;
    Label3: TLabel;
    dbEdRendaComp: TDBEdit;
    Label4: TLabel;
    dbEdNMargemConsig: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaFiador: TfrmPessoaFiador;

implementation

uses FCadInscricao;

{$R *.DFM}

end.
