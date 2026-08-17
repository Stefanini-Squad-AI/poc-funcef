unit FConsRecLoteMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBClient, wwclient, Wwdatsrc, ComCtrls, StdCtrls, Grids,
  Wwdbigrd, Wwdbgrid, CMProcuraSubTipo, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Buttons, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls,TREdit, DBCtrls, DBTables, 
  MontaSelect, uCmSqlParams, FSairAjuda;

type
  TfrmConsRecLoteMT = class(TfrmSairAjuda)
    dsRecebimentos: TwwDataSource;
    cdsRecebimentos: TwwClientDataSet;
    dbgrRecebimentos: TwwDBGrid;
    pnlSeleciona: TPanel;
    spdSeleciona: TSpeedButton;
    DBText1: TDBText;
    lblNumLote: TLabel;
    Label1: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText3: TDBText;
    Label3: TLabel;
    DBText4: TDBText;
    MontaSelect: TMontaSelect;
    Label4: TLabel;
    reTotRec: TRealEdit;
    sqlRecebimentos: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure spdSelecionaClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaLote(iEmpresa,iCodPortForma : Double; sDataCFloat,sNumChqBord : String);
  public
    { Public declarations }
  end;

var
  frmConsRecLoteMT: TfrmConsRecLoteMT;

implementation

uses uMensErro,uDataBase, DBaseDados,USistema,UModulo;

{$R *.DFM}

procedure TfrmConsRecLoteMT.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  SelecionaLote(-1,-1,'','');
end;

procedure TfrmConsRecLoteMT.SelecionaLote(iEmpresa,iCodPortForma : Double; sDataCFloat,sNumChqBord : String);
var rTotalS : Double;
begin
   sqlRecebimentos.Prepare;
   sqlRecebimentos.ParamByName('IDPESSOA').AsFloat       := iEmpresa;
   sqlRecebimentos.ParamByName('CODPORTFORMA').AsFloat   := iCodPortForma;
   sqlRecebimentos.ParamByName('DATACFLOAT').AsString    := sDataCFloat;
   sqlRecebimentos.ParamByName('NUMCHQBORDERO').AsString := sNumChqBord;
   sqlRecebimentos.Open;
   TFloatField(cdsRecebimentos.FieldByName('VALOR')).DisplayFormat := '#,##0.00';

   rTotalS := 0;
   cdsRecebimentos.DisableControls;
   cdsRecebimentos.First;
   while not cdsRecebimentos.Eof do begin
      rTotalS := rTotalS + cdsRecebimentos.FieldByName('VALOR').AsFloat;
      cdsRecebimentos.Next;
   end;
   cdsRecebimentos.First;
   cdsRecebimentos.EnableControls;
   reTotRec.Value := rTotalS;
end;

procedure TfrmConsRecLoteMT.spdSelecionaClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then begin
     SelecionaLote(Sistema.idEmpresa,StrToFloat(MontaSelect.ValoresChave[1]),MontaSelect.ValoresChave[2],MontaSelect.ValoresChave[0]);
  end;
end;

end.


