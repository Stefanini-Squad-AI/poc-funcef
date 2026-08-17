unit fMTConsInventBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCmSqlParams, IvEMulti;

type
  TfrmMTConsInventBens = class(TfrmSairAjuda)
    pnlDados: TPanel;
    pnlGrid: TPanel;
    MSInventBens: TMontaSelect;
    dsInventBens: TwwDataSource;
    dsItensInvBens: TwwDataSource;
    Label1: TLabel;
    dbeIdInventario: TwwDBEdit;
    bbtnSelLevant: TBitBtn;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    dbeDataInicio: TCMDateTimePicker;
    rdgOpcoes: TRadioGroup;
    dbGrd: TwwDBGrid;
    pnlDetalhe: TPanel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBCheckBox1: TDBCheckBox;
    Panel1: TPanel;
    DBDateEdit1: TCMDateTimePicker;
    dbeResponsavel: TwwDBEdit;
    Label4: TLabel;
    sqlInventBens: TCMSqlParams;
    cdsInventBens: TCMClientDataSet;
    cdsItensInvBens: TCMClientDataSet;
    sqlItensInvBens: TCMSqlParams;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelLevantClick(Sender: TObject);
    procedure rdgOpcoesClick(Sender: TObject);
    procedure bbtnSelLevantEnter(Sender: TObject);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdTopRowChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SelInventBens(iInvent,iEmpresa,iOpcao : Integer);
  public
    { Public declarations }
  end;

var
  frmMTConsInventBens: TfrmMTConsInventBens;

implementation

{$R *.DFM}

Uses uSistema;

procedure TfrmMTConsInventBens.FormCreate(Sender: TObject);
begin
   inherited;
   MSInventBens.Filtro.Add('INVENTARIOBENS.IDEMPRESA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   pnlDetalhe.Enabled := False;
   SelInventBens(-1, -1, rdgOpcoes.ItemIndex);
   rdgOpcoes.Enabled := False;
end;
//========================================================================================
procedure TfrmMTConsInventBens.bbtnSelLevantClick(Sender: TObject);
begin
   inherited;
   MSInventBens.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSInventBens.RetornouValor then
   begin
      sqlInventBens.Prepare;
      sqlInventBens.ParamByName('IDINVENTARIOBENS').AsFloat := StrToFloat(MSInventBens.ValoresChave[0]);
      sqlInventBens.ParamByName('IDEMPRESA').AsFloat := StrToFloat(MSInventBens.ValoresChave[1]);
      sqlInventBens.Open;
      //----------------------------------------------------------------------------------
      SelInventBens(cdsInventBens.Fieldbyname('IDINVENTARIOBENS').AsInteger,
                    cdsInventBens.Fieldbyname('IDEMPRESA').AsInteger,
                    rdgOpcoes.ItemIndex);
      rdgOpcoes.Enabled := True;
   end;
end;
//========================================================================================
procedure TfrmMTConsInventBens.SelInventBens(iInvent, iEmpresa, iOpcao : Integer);
begin
   Screen.Cursor := crSQLWait;
   cdsItensInvBens.Close;
   //-------------------------------------------------------------------------------------
   // IIBFLGPLACA
   //-------------------------------------------------------------------------------------
   // 0 - ...
   // 1 - Ok
   // 2 - Placa não Encontrada
   // 3 - Placa em Outro Local
   // 4 - Placa de Outro Local
   // 5 - Placa não Cadastrada
   //-------------------------------------------------------------------------------------
   if rdgOpcoes.ItemIndex = 0 then
   begin
      sqlItensInvBens.SQL.Strings[32] := ' ';
   end else
   if rdgOpcoes.ItemIndex = 1 then
   begin
      sqlItensInvBens.SQL.Strings[32] := '  AND I.IIBFLGPLACA = 1';
   end else
   if rdgOpcoes.ItemIndex = 2 then
   begin
      sqlItensInvBens.SQL.Strings[32] := '  AND I.IIBFLGPLACA = 2';
   end else
   if rdgOpcoes.ItemIndex = 3 then
   begin
      sqlItensInvBens.SQL.Strings[32] := '  AND I.IIBFLGPLACA = 5';
   end else
   if rdgOpcoes.ItemIndex = 4 then
   begin
      sqlItensInvBens.SQL.Strings[32] := '  AND I.IIBFLGPLACA = 4';
   end else
   if rdgOpcoes.ItemIndex = 5 then
   begin
      sqlItensInvBens.SQL.Strings[32] := '  AND I.IIBFLGPLACA = 3';
   end else
   begin
      sqlItensInvBens.SQL.Strings[32] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   sqlItensInvBens.Prepare;
   sqlItensInvBens.ParamByName('IDINVENTARIOBENS').AsInteger := iInvent;
   sqlItensInvBens.ParamByName('IDEMPRESA').AsInteger := iEmpresa;
   cdsItensInvBens.DisableControls;
   sqlItensInvBens.Open;
   cdsItensInvBens.EnableControls;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
   dbGrd.Enabled := not cdsItensInvBens.IsEmpty;
end;
//========================================================================================
procedure TfrmMTConsInventBens.rdgOpcoesClick(Sender: TObject);
begin
   inherited;
   SelInventBens(cdsInventBens.FieldbyName('IDINVENTARIOBENS').AsInteger,
                 cdsInventBens.FieldbyName('IDEMPRESA').AsInteger,
                 rdgOpcoes.ItemIndex);
end;
//========================================================================================
procedure TfrmMTConsInventBens.bbtnSelLevantEnter(Sender: TObject);
begin
   inherited;
   cdsInventBens.Close;
   SelInventBens(-1,-1,rdgOpcoes.ItemIndex);
   rdgOpcoes.Enabled := False;
end;
//========================================================================================
procedure TfrmMTConsInventBens.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;
//========================================================================================
procedure TfrmMTConsInventBens.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := clWhite;
         end else begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;
//========================================================================================
procedure TfrmMTConsInventBens.dbGrdTopRowChanged(Sender: TObject);
begin
   inherited;
   dbGrd.Invalidate;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTConsInventBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsItensInvBens.Close;
   cdsInventBens.Close;
end;

end.
