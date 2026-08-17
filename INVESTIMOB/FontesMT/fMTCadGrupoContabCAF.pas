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

unit fMTCadGrupoContabCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fMTCadGrupoContab, uCmSqlParams, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, TREdit, ComCtrls, TabControlDetalhe, DBCtrls,
  ExtCtrls, Mask, wwdbedit;

type
  TfrmMTCadGrupoContabCAF = class(TfrmMTCadGrupoContab)
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMTCadGrupoContabCAF: TfrmMTCadGrupoContabCAF;

implementation

{$R *.DFM}

procedure TfrmMTCadGrupoContabCAF.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   // Define valores default para o imobiliário
   cds.FieldByName('FLGIMOVEL').AsInteger   := 1;
   cds.FieldByName('FLGSEMPLACA').AsInteger := 1;
end;

end.
