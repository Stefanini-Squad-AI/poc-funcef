unit RIndicador;

//	------------------------------------------------------------------------------------------------
//
//	Consulta de Indicadores
//
//	Autor             :	André Pontes
//	Data de Início    :	24/02/1999
//	Data de Término   :  24/02/1999
//
//	Modificações      :  09/04/1999  - Escolha da ordenação, Filtro por tipo de valor
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, Grids, Wwdbigrd,
  Wwdbgrid, Wwdbgrd2, wwdblook, IvDictio, IvMulti, IvEMulti, FSairAjudaImob;

type
  TfrmRelIndicadores = class(TfrmSairAjudaImob)
    qryLookImovel: TwwQuery;
    qryLookImovelIMONOME: TStringField;
    qryLookImovelIDIMOVEL: TFloatField;
    qryLookIndicador: TwwQuery;
    qryLookIndicadorINMDESCRICAO: TStringField;
    qryLookIndicadorIDINDICADORIMOVEL: TFloatField;
    dsExibe: TwwDataSource;
    qryExibePorData: TwwQuery;
    qryExibePorDataIDIMOVEL: TFloatField;
    qryExibePorDataIDINDICADORIMOVEL: TFloatField;
    qryExibePorDataIXIDATAMEDICAO: TDateTimeField;
    qryExibePorDataMOECODIGO: TFloatField;
    qryExibePorDataIXIVALOR: TFloatField;
    qryExibePorDataIXIVALOROM: TFloatField;
    qryExibePorDataINMDESCRICAO: TStringField;
    qryExibePorDataFLGTIPOVALOR: TStringField;
    qryExibePorDataMOESIGLA: TStringField;
    qryExibePorDataSimbolo: TStringField;
    qryExibePorDataTipo: TStringField;
    qryExibePorIndicador: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    StringField4: TStringField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    DBgrdPrincipal: TwwDBGrid2;
    DBcboIndicador: TwwDBLookupCombo;
    DBcboImovel: TwwDBLookupCombo;
    btnBuscaImovel: TBitBtn;
    cboTipoIndicador: TComboBox;
    cboOrdenacao: TComboBox;

    // procedimentos definidos
    procedure Filtra;
    procedure Ordena;

    procedure PreparaQueries;
    procedure AbreQueries;
    procedure FechaQueries;

    // outros procedimentos
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure DBgrdPrincipalTopRowChanged(Sender: TObject);
    procedure DBgrdPrincipalCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
              Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure cboTipoIndicadorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBcboImovelChange(Sender: TObject);
    procedure DBcboIndicadorChange(Sender: TObject);
    procedure qryExibePorIndicadorCalcFields(DataSet: TDataSet);
    procedure qryExibePorDataCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
   iImovel, iIndicador : integer;

  public { Public declarations }

  end;



var
  frmRelIndicadores: TfrmRelIndicadores;



implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
  dLookImobiliario, uFuncoesImob, DMS;



procedure TfrmRelIndicadores.Filtra;
begin
   // "desliga" as queries da grid
   dsExibe.DataSet := nil;

   // fecha as queries para passar novos parâmetros
   qryExibePorData.Close;
   qryExibePorIndicador.Close;

   if ( length(trim(DBcboImovel.Text)) > 0 ) then begin
      qryExibePorData.Params[0].asInteger       := iImovel;
      qryExibePorData.Params[1].asInteger       := iImovel;
      qryExibePorIndicador.Params[0].asInteger  := iImovel;
      qryExibePorIndicador.Params[1].asInteger  := iImovel;
   end else begin
      qryExibePorData.Params[0].asInteger       := 0;
      qryExibePorData.Params[1].asInteger       := high(integer);
      qryExibePorIndicador.Params[0].asInteger  := 0;
      qryExibePorIndicador.Params[1].asInteger  := high(integer);
   end;

   Case cboTipoIndicador.ItemIndex of

      0:
      begin
         qryExibePorData.Params[4].asString       := 'M';
         qryExibePorData.Params[5].asString       := 'Q';
         qryExibePorIndicador.Params[4].asString  := 'M';
         qryExibePorIndicador.Params[5].asString  := 'Q';
      end;

      1:
      begin
         qryExibePorData.Params[4].asString       := 'M';
         qryExibePorData.Params[5].asString       := 'M';
         qryExibePorIndicador.Params[4].asString  := 'M';
         qryExibePorIndicador.Params[5].asString  := 'M';
      end;

      2:
      begin
         qryExibePorData.Params[4].asString       := 'P';
         qryExibePorData.Params[5].asString       := 'P';
         qryExibePorIndicador.Params[4].asString  := 'P';
         qryExibePorIndicador.Params[5].asString  := 'P';
      end;

      3:
      begin
         qryExibePorData.Params[4].asString       := 'Q';
         qryExibePorData.Params[5].asString       := 'Q';
         qryExibePorIndicador.Params[4].asString  := 'Q';
         qryExibePorIndicador.Params[5].asString  := 'Q';
      end;

   end;

   if ( length(trim(DBcboIndicador.Text)) > 0 ) then begin
      qryExibePorData.Params[2].asInteger       := iIndicador;
      qryExibePorData.Params[3].asInteger       := iIndicador;
      qryExibePorIndicador.Params[2].asInteger  := iIndicador;
      qryExibePorIndicador.Params[3].asInteger  := iIndicador;
   end else begin
      qryExibePorData.Params[2].asInteger       := 0;
      qryExibePorData.Params[3].asInteger       := high(integer);
      qryExibePorIndicador.Params[2].asInteger  := 0;
      qryExibePorIndicador.Params[3].asInteger  := high(integer);
   end;

   qryExibePorData.Open;
   qryExibePorIndicador.Open;

   Ordena;
end;



procedure TfrmRelIndicadores.Ordena;
begin
   case cboOrdenacao.ItemIndex of
      0: dsExibe.DataSet   := qryExibePorData;
      1: dsExibe.DataSet   := qryExibePorIndicador;
      else dsExibe.DataSet := nil;
   end;
end;



procedure TfrmRelIndicadores.PreparaQueries;
begin
   qryLookImovel.Close;
   qryLookImovel.Prepare;

   qryExibePorData.Close;
   qryExibePorData.Prepare;

   qryExibePorIndicador.Close;
   qryExibePorIndicador.Prepare;
end;



procedure TfrmRelIndicadores.AbreQueries;
begin
   qryLookIndicador.Open;
end;



procedure TfrmRelIndicadores.FechaQueries;
begin
   qryLookImovel.Close;
   qryLookImovel.UnPrepare;

   qryLookIndicador.Close;
   qryLookIndicador.UnPrepare;

   qryExibePorData.Close;
   qryExibePorData.UnPrepare;

   qryExibePorIndicador.Close;
   qryExibePorIndicador.UnPrepare;
end;

procedure TfrmRelIndicadores.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_Imovel.Executar;

   // redesenha o form na volta do dtmMS.MS_Imovel
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Imovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovel := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);
      with qryLookImovel do begin
         LimpaParametros(qryLookImovel);
         Params[0].asInteger := iImovel;
         Open;
      end;

      Screen.Cursor := crDefault;
   end;

   DBcboImovel.Text := qryLookImovel.FieldByName('IMONOME').asString;
   DBcboImovel.PerformSearch;

   btnBuscaImovel.SetFocus;
end;



procedure TfrmRelIndicadores.DBgrdPrincipalTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdPrincipal.Invalidate;
end;



procedure TfrmRelIndicadores.DBgrdPrincipalCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmRelIndicadores.cboTipoIndicadorKeyPress(Sender: TObject; var Key: Char);
begin
   key := #0;
end;



procedure TfrmRelIndicadores.FormShow(Sender: TObject);
begin
   inherited;

   PreparaQueries;
   AbreQueries;

   // seta as combos para o valor default
   cboTipoIndicador.ItemIndex := 0;
   cboOrdenacao.ItemIndex     := 0;
end;



procedure TfrmRelIndicadores.DBcboImovelChange(Sender: TObject);
begin
   inherited;

   Filtra;
end;



procedure TfrmRelIndicadores.DBcboIndicadorChange(Sender: TObject);
begin
   inherited;

   if ( length(trim(DBcboIndicador.Text)) > 0 ) then begin
      iIndicador := qryLookIndicador.FieldByName('IDINDICADORIMOVEL').asInteger;
   end;

   Filtra;
end;



procedure TfrmRelIndicadores.qryExibePorIndicadorCalcFields(DataSet: TDataSet);
begin
   inherited;

   if qryExibePorIndicador.FieldByName('FLGTIPOVALOR').asString = 'P' then begin
      qryExibePorIndicador.FieldByName('Simbolo').asString  := '%';
      qryExibePorIndicador.FieldByName('Tipo').asString     := 'Percentual';
   end else begin
      qryExibePorIndicador.FieldByName('Simbolo').asString  := '';

      if qryExibePorIndicador.FieldByName('FLGTIPOVALOR').asString = 'M' then begin
         qryExibePorIndicador.FieldByName('Tipo').asString  := 'Monetário';
      end else begin
         qryExibePorIndicador.FieldByName('Tipo').asString  := 'Quantitativo';
      end;
   end;
end;



procedure TfrmRelIndicadores.qryExibePorDataCalcFields(DataSet: TDataSet);
begin
   inherited;

   if qryExibePorIndicador.FieldByName('FLGTIPOVALOR').asString = 'P' then begin
      qryExibePorData.FieldByName('Simbolo').asString  := '%';
      qryExibePorData.FieldByName('Tipo').asString     := 'Percentual';
   end else begin
      qryExibePorData.FieldByName('Simbolo').asString  := '';

      if qryExibePorData.FieldByName('FLGTIPOVALOR').asString = 'M' then begin
         qryExibePorData.FieldByName('Tipo').asString  := 'Monetário';
      end else begin
         qryExibePorData.FieldByName('Tipo').asString  := 'Quantitativo';
      end;
   end;
end;



procedure TfrmRelIndicadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FechaQueries;
end;



end.
