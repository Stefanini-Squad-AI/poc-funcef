unit fCadRegEtp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCustomCadRegEtp, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, CMProcuraSubTipo,
  DBCtrls, TREdit, Mask, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmCadRegEtp = class(TfrmCustomCadRegEtp)
    Label30: TLabel;
    dbedNumJCJ: TDBEdit;
    rgSituacao: TDBRadioGroup;
    CMProcuraReq: TCMProcuraSubTipo;
    dbrgMateria: TDBRadioGroup;
  
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure OnClick_ProcurarProcesso; override;
    procedure OnClick_ProcurarProcessoComLitisconsortes; override;
  end;

var
  frmCadRegEtp: TfrmCadRegEtp;

implementation

{$R *.DFM}

procedure TfrmCadRegEtp.OnClick_ProcurarProcesso;
begin
  //MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA IN (2,3)');
end;

procedure TfrmCadRegEtp.OnClick_ProcurarProcessoComLitisconsortes;
begin
  //MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA IN (2,3)');
end;

end.
