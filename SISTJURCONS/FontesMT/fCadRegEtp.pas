//N. Sol..........: 135759
//N. Kintana......: 808903
//Data............: 13/05/2010
//Responsável.....: Adilson Filho
//Descrição.......: solicito a retirada da critica nunsecvinc relativa aso Dep. Recursal.
//************************************************************************************************
unit fCadRegEtp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCustomCadRegEtp, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, CMProcuraSubTipo,
  DBCtrls, TREdit, Mask, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  uCmSqlParams, DBTables, Wwquery;

type
  TfrmCadRegEtp = class(TfrmCustomCadRegEtp)
  
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
