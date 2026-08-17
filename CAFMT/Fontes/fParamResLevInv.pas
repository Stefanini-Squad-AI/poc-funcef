unit fParamResLevInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, Wwdatsrc,
  MontaSelect;

type
  TfrmParamResLevInv = class(TfrmOkCancelar)
    MSInventBens: TMontaSelect;
    qryInventBens: TwwQuery;
    qryInventBensIDINVENTARIOBENS: TFloatField;
    qryInventBensIDEMPRESA: TFloatField;
    qryInventBensIDRESPONSAVEL: TFloatField;
    qryInventBensDATAINILEVANT: TDateTimeField;
    qryInventBensDATAFIMLEVANT: TDateTimeField;
    qryInventBensSTATUS: TFloatField;
    qryInventBensENCERRADO: TFloatField;
    qryInventBensNOMERESP: TStringField;
    dsInventBens: TwwDataSource;
    Label1: TLabel;
    dbeIdInventario: TwwDBEdit;
    bbtnSelLevant: TBitBtn;
    Label3: TLabel;
    dbeDataInicio: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    Panel1: TPanel;
    DBDateEdit1: TCMDateTimePicker;
    dbeResponsavel: TwwDBEdit;
    Label4: TLabel;
    rdgOpcoes: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelLevantClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamResLevInv: TfrmParamResLevInv;

implementation

{$R *.DFM}

uses uSistema, dRelOperCaf, uMensErro;

procedure TfrmParamResLevInv.FormCreate(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   if not qryInventBens.Prepared then
      qryInventBens.Prepare;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamResLevInv.FormActivate(Sender: TObject);
begin
   inherited;
   if not dtmRelOperCaf.qryResLevInv.Prepared then
      dtmRelOperCaf.qryResLevInv.Prepare;
end;
//========================================================================================
procedure TfrmParamResLevInv.bbtnSelLevantClick(Sender: TObject);
begin
   inherited;
   MSInventBens.Executar;
   Application.ProcessMessages;
   if (MSInventBens.RetornouValor) then
   begin
      Screen.Cursor := crSQLWait;
      //----------------------------------------------------------------------------------
      qryInventBens.Close;
      qryInventBens.Params[0].Value := MSInventBens.ValoresChave[0];
      qryInventBens.Params[1].Value := MSInventBens.ValoresChave[1];
      qryInventBens.Open;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   end;
end;
//========================================================================================
procedure TfrmParamResLevInv.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf do
   begin
      qryResLevInv.Close;
      case rdgOpcoes.ItemIndex of
         0 : qryResLevInv.SQL.Strings[27] := ' ';
         1 : qryResLevInv.SQL.Strings[27] := ' AND (I.IIBFLGPLACA = 1)';
         2 : qryResLevInv.SQL.Strings[27] := ' AND (I.IIBFLGPLACA = 2)';
         3 : qryResLevInv.SQL.Strings[27] := ' AND (I.IIBFLGPLACA = 5)';
         4 : qryResLevInv.SQL.Strings[27] := ' AND (I.IIBFLGPLACA = 4)';
         5 : qryResLevInv.SQL.Strings[27] := ' AND (I.IIBFLGPLACA = 3)';
      else
         qryResLevInv.SQL.Strings[27] := ' ';
      end;
      //----------------------------------------------------------------------------------
      qryResLevInv.ParamByName('PIDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
      qryResLevInv.ParamByName('PIDEMPRESA').AsInteger        := qryInventBensIDEMPRESA.AsInteger;
      qryResLevInv.Open;
      //----------------------------------------------------------------------------------
      case rdgOpcoes.ItemIndex of
         0 : lblSelecao.Caption := rdgOpcoes.Items.Strings[0];
         1 : lblSelecao.Caption := rdgOpcoes.Items.Strings[1];
         2 : lblSelecao.Caption := rdgOpcoes.Items.Strings[2];
         3 : lblSelecao.Caption := rdgOpcoes.Items.Strings[3];
         4 : lblSelecao.Caption := rdgOpcoes.Items.Strings[4];
         5 : lblSelecao.Caption := rdgOpcoes.Items.Strings[5];
      else
         lblSelecao.Caption := 'Completo';
      end;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmParamResLevInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryInventBens.Close;
   qryInventBens.Prepare;
end;

end.







