unit fCadRegHon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCustomCadRegHon,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, TREdit, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker,
  Mask, DBCtrls, ExtCtrls, CMProcuraSubTipo;

type
  TfrmCadRegHon = class(TfrmCustomCadRegHon)
    Label3: TLabel;
    dbedNumJCJ: TDBEdit;
    Label13: TLabel;
    dbedJCJ: TDBEdit;
    dbrgMateria: TDBRadioGroup;
    rgSituacao: TDBRadioGroup;
    CMProcuraRequerente: TCMProcuraSubTipo;
  end;

var
  frmCadRegHon: TfrmCadRegHon;

implementation

{$R *.DFM}

end.
