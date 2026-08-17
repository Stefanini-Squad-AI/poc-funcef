unit FCadLayoutsCnab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  Wwdbspin, Wwdotdot, Wwdbcomb, uCmSqlParams;

type
  TFrmCadModelosCnabMT = class(TFrmCadastroMestreDetMT)
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    dbedValfixo: TwwDBEdit;
    dbedExtensao: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbchkData: TDBCheckBox;
    dbchkSeqNum: TDBCheckBox;
    dbrTipoEmiss: TDBRadioGroup;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Label4: TLabel;
    dbedDescricao: TwwDBEdit;
    dbComboTipoLinha: TwwDBComboBox;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    CMSqlParams1: TCMSqlParams;
    cdsDet: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadModelosCnabMT: TFrmCadModelosCnabMT;

implementation

{$R *.DFM}

end.
