{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fConsultMovimCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fMTConsHistMovBem, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, Buttons, fcLabel, TB97, TB97Tlwn,
  StdCtrls, Mask, wwdbedit, ExtCtrls, FConsultMovim, MontaSelect,
  uCmSqlParams, DBClient, uCMClientDataSet, wwdblook;

type
  TfrmConsultMovimCAF = class(TfrmMTConsHistMovBem)
    procedure spdPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultMovimCAF: TfrmConsultMovimCAF;

implementation

uses dms;

{$R *.DFM}

procedure TfrmConsultMovimCAF.spdPesquisaClick(Sender: TObject);
begin
// Início - Marcio Motta - 24/01/2005
  inherited;
// Fim - Marcio Motta - 24/01/2005
end;

end.
