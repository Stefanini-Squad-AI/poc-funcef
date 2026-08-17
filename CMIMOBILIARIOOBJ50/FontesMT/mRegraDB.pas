unit mRegraDB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, MontaSelect, uMensErro, uCtrlCadRegra, uCtrlPadroes,
  Db, DBClient, uCMClientDataSet;

type
  TmolRegraDB = class(TFrame)
    Regra: TLabel;
    DBedtRegra: TDBEdit;
    btnBuscaRegra: TBitBtn;
    btnLimpaRegra: TBitBtn;
    DBedtIDRegra: TDBEdit;
    MS_Regra: TMontaSelect;
    sbHelpRegra: TSpeedButton;
    cdsRegra: TCMClientDataSet;

    procedure btnBuscaRegraClick(Sender: TObject);
    procedure btnLimpaRegraClick(Sender: TObject);
    procedure sbHelpRegraClick(Sender: TObject);


  private { Private declarations }

    CtrlCadRegra       : TCtrlCadRegra;

  public { Public declarations }
   iRegra     : int64;
   sRegra     : string;
   sDescricao : String;

  end;



implementation

{$R *.DFM}



procedure TmolRegraDB.btnBuscaRegraClick(Sender: TObject);
begin
   MS_Regra.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MS_Regra.RetornouValor then begin

      iRegra     := StrToInt(MS_Regra.ValoresChave[0]);
      sRegra     := MS_Regra.ValoresChave[1];
      sDescricao := MS_Regra.ValoresChave[2];

      // Controle dos campos DB (IDs) invisíveis
      if DBedtIDRegra.DataField <> '' then DBedtIDRegra.DataSource.DataSet.FieldByName(DBedtIDRegra.DataField).AsInteger := iRegra;
      if DBedtRegra.DataField <> '' then DBedtRegra.DataSource.DataSet.FieldByName(DBedtRegra.DataField).AsString := sRegra;

   end;

   btnBuscaRegra.SetFocus;
end;



procedure TmolRegraDB.btnLimpaRegraClick(Sender: TObject);
begin
   iRegra     := -1;
   sRegra     := '';
   sDescricao := '';

   // Controle dos campos DB (IDs) invisíveis
   if DBedtIDRegra.DataField <> '' then DBedtIDRegra.DataSource.DataSet.FieldByName(DBedtIDRegra.DataField).Clear;
   if DBedtRegra.DataField <> '' then DBedtRegra.DataSource.DataSet.FieldByName(DBedtRegra.DataField).Clear;
end;



procedure TmolRegraDB.sbHelpRegraClick(Sender: TObject);
begin
  CtrlCadRegra       := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs( Padroes );
  cdsRegra.Data      := CtrlCadRegra.SelecionaRegra(DBedtIDRegra.DataSource.DataSet.FieldByName(DBedtIDRegra.DataField).AsInteger);
  sDescricao         := cdsRegra.FieldByName('DESCRICAOREGRA').AsString;
  MsgDlg(sDescricao,'Descrição da Regra',mtInformation,[mbOk],0);

  FreeAndNil( CtrlCadRegra );
end;

end.
