unit fCadGrpApuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, ExtCtrls, DBCtrls, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  DBTables, Provider;

type
  TfrmCadGrpApuracao = class(TFrmCadastroMT)
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    wwDBEdit1: TwwDBEdit;
    DataSetProvider1: TDataSetProvider;
    Query1: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrpApuracao: TfrmCadGrpApuracao;

implementation

{$R *.DFM}

end.
