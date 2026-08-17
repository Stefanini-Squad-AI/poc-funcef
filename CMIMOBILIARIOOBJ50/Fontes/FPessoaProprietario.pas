unit FPessoaProprietario;

//	------------------------------------------------------------------------------------------------
//
//	Cadastro de Proprietários de Imóveis
//
//	Autor          :  André Pontes
//	Data de Início :  18/01/1999
//	Data de Término:  18/01/1999
//	Modificações	:
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, StdCtrls, DBCtrls, checklst,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TB97,
  TabControlDetalhe, wwdblook, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Wwdotdot, Wwdbcomb, TREdit;

type
  TfrmPessoaProprietario = class(TfrmPessoa)
    qrySubTipoIDPROPRIETARIOUH: TFloatField;
    wwDBComboBox1: TwwDBComboBox;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmPessoaProprietario: TfrmPessoaProprietario;



implementation
{$R *.DFM}



end.
