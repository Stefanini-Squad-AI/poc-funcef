unit fConsultInvLevant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcLabel, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsultInvLevant = class(TfrmSairAjuda)
    pnlDados: TPanel;
    pnlGrid: TPanel;
    MSInventBens: TMontaSelect;
    qryInventBens: TwwQuery;
    dsInventBens: TwwDataSource;
    qry: TwwQuery;
    ds: TwwDataSource;
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
    qryInventBensIDINVENTARIOBENS: TFloatField;
    qryInventBensIDEMPRESA: TFloatField;
    qryInventBensIDRESPONSAVEL: TFloatField;
    qryInventBensDATAINILEVANT: TDateTimeField;
    qryInventBensDATAFIMLEVANT: TDateTimeField;
    qryInventBensSTATUS: TFloatField;
    qryInventBensENCERRADO: TFloatField;
    qryInventBensNOMERESP: TStringField;
    qryIIBPLACA: TFloatField;
    qryDESCFLGPLACA: TStringField;
    qryDESCCONJUNTO_DE: TStringField;
    qryDESCLOCAL_DE: TStringField;
    qryNOMERESP_DE: TStringField;
    qryDESCCONJUNTO_PARA: TStringField;
    qryDESCLOCAL_PARA: TStringField;
    qryNOMERESP_PARA: TStringField;
    qryDESCFLGSITFISICA: TStringField;
    qryDESBEM: TStringField;
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
    procedure ProcessaQRY(iInvent,iEmpresa,iOpcao : Integer);
  public
    { Public declarations }
  end;

var
  frmConsultInvLevant: TfrmConsultInvLevant;

implementation

{$R *.DFM}


procedure TfrmConsultInvLevant.FormCreate(Sender: TObject);
begin
   inherited;
   qryInventBens.Prepare;
   qry.Prepare;
   pnlDetalhe.Enabled := False;
   ProcessaQRY(-1,-1,rdgOpcoes.ItemIndex);
   rdgOpcoes.Enabled := False;
end;
//========================================================================================
procedure TfrmConsultInvLevant.bbtnSelLevantClick(Sender: TObject);
begin
   inherited;
   MSInventBens.Executar;
   Repaint;
   if (MSInventBens.RetornouValor) then
   begin
      Screen.Cursor := crHourGlass;
      //----------------------------------------------------------------------------------
      qryInventBens.Close;
      qryInventBens.Params[0].Value := MSInventBens.ValoresChave[0];
      qryInventBens.Params[1].Value := MSInventBens.ValoresChave[1];
      qryInventBens.Open;
      //----------------------------------------------------------------------------------
      ProcessaQRY(qryInventBensIDINVENTARIOBENS.AsInteger,
                  qryInventBensIDEMPRESA.AsInteger,
                  rdgOpcoes.ItemIndex);
      rdgOpcoes.Enabled := True;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      dbGrd.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmConsultInvLevant.ProcessaQRY(iInvent,iEmpresa,iOpcao : Integer);
begin
   Screen.Cursor := crSQLWait;
   qry.Close;
   qry.DisableControls;
   //-------------------------------------------------------------------------------------
   // Filtragem de Opções
   //-------------------------------------------------------------------------------------
   case rdgOpcoes.ItemIndex of
      0 : qry.SQL.Strings[25] := ' ';
      1 : qry.SQL.Strings[25] := '  AND (I.IIBFLGPLACA = 1)';
      2 : qry.SQL.Strings[25] := '  AND (I.IIBFLGPLACA = 2)';
      3 : qry.SQL.Strings[25] := '  AND (I.IIBFLGPLACA = 5)';
      4 : qry.SQL.Strings[25] := '  AND (I.IIBFLGPLACA = 4)';
      5 : qry.SQL.Strings[25] := '  AND (I.IIBFLGPLACA = 3)';
   else
      qry.SQL.Strings[25] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   qry.Params[0].Value := iInvent;
   qry.Params[1].Value := iEmpresa;
   qry.EnableControls;
   qry.Open;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
   dbGrd.Enabled := not qry.IsEmpty;
end;
//========================================================================================
procedure TfrmConsultInvLevant.rdgOpcoesClick(Sender: TObject);
begin
   inherited;
   ProcessaQRY(qryInventBensIDINVENTARIOBENS.AsInteger,
               qryInventBensIDEMPRESA.AsInteger,
               rdgOpcoes.ItemIndex);
end;
//========================================================================================
procedure TfrmConsultInvLevant.bbtnSelLevantEnter(Sender: TObject);
begin
   inherited;
   qryInventBens.Close;
   ProcessaQRY(-1,-1,rdgOpcoes.ItemIndex);
   rdgOpcoes.Enabled := False;
end;
//========================================================================================
procedure TfrmConsultInvLevant.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;
//========================================================================================
procedure TfrmConsultInvLevant.dbGrdCalcCellColors(Sender: TObject;
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
procedure TfrmConsultInvLevant.dbGrdTopRowChanged(Sender: TObject);
begin
   inherited;
   dbGrd.Invalidate;
end;
//========================================================================================
procedure TfrmConsultInvLevant.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryInventBens.Close;
   qry.Close;
   qryInventBens.UnPrepare;
   qry.UnPrepare;
end;

end.
