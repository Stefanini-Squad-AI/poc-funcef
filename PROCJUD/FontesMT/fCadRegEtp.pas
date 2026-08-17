unit fCadRegEtp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCustomCadRegEtp,
  CMProcuraSubTipo, ExtCtrls, DBCtrls, MontaSelect, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  CmEventosCadastro, ImgList, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, TB97Ctls, TB97, TREdit, Mask, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams;

type
  TfrmCadRegEtp = class(TfrmCustomCadRegEtp)
    Label8: TLabel;
    dbedNumJCJ2: TDBEdit;
    rgAtivo: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
    rgSituacao2: TDBRadioGroup;
    CMProcuraRequerente: TCMProcuraSubTipo;
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
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA > 3');
end;

procedure TfrmCadRegEtp.OnClick_ProcurarProcessoComLitisconsortes;
begin
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA > 3');
end;

end.
