unit fPessoaBenefSeguro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, CmEventosCadastro, ImgList, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwdatsrc, Wwquery, MAHlpBtn,
  TB97Tlbr, Buttons, TB97Ctls, TB97, DBCtrls, StdCtrls, CheckLst, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, CMDBLookupCombo, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, wwdblook, ExtCtrls,
  TabControlDetalhe, wwdbedit, Mask;

type
  TfrmPessoaBenefSeguro = class(TfrmPessoa)
    qrySubTipoIDBENEFSEGURO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaBenefSeguro: TfrmPessoaBenefSeguro;

implementation

{$R *.DFM}

end.
