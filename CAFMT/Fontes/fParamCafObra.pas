unit fParamCafObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook,
  Wwdatsrc, Mask, wwdbedit, MontaSelect, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamCafObra = class(TfrmOkCancelar)
    Label4: TLabel;
    bbtnSelBem: TBitBtn;
    rdgFlgObra: TRadioGroup;
    MSObra: TMontaSelect;
    edDescObra: TMemo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMascaraGrupo, sMascaraPlaca, sMascaraEmpresa : String;
  end;

var
  frmParamCafObra: TfrmParamCafObra;

implementation

{$R *.DFM}

uses uSistema, dRelOperCaf,  uMensErro, dAtivoFixo;

procedure TfrmParamCafObra.bbtnSelBemClick(Sender: TObject);
begin
   MSObra.Executar;
   Application.ProcessMessages;
   if MSObra.RetornouValor then
      edDescObra.Text := MSObra.ValoresChave[2]
   else
      edDescObra.Text;
end;

procedure TfrmParamCafObra.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf do
   begin
      qryCafObras.Close;
      if edDescObra.Text <> '' then
      begin
         qryCafObras.SQL.Strings[13] := ' (O.IDCAFOBRA = '+MSObra.ValoresChave[0]+') AND ';
         qryCafObras.SQL.Strings[14] := ' (O.IDPESSOA  = '+MSObra.ValoresChave[1]+') AND ' ;
         qryCafObras.SQL.Strings[15] := ' ';
      end else
      begin
         qryCafObras.SQL.Strings[13] := ' ';
         qryCafObras.SQL.Strings[14] := ' ';
         if rdgFlgObra.ItemIndex < 2 then
         begin
            qryCafObras.SQL.Strings[15] := ' (O.FLGOBRA = '+inttostr(rdgFlgObra.ItemIndex)+') AND ';
         end else
         begin
            qryCafObras.SQL.Strings[15] := ' ';
         end;
      end;
      //----------------------------------------------------------------------------------
      qryCafObras.Open;
      Screen.Cursor := crDefault;
      if qryCafObras.IsEmpty then
         MsgDlg('Não existem Obras para os parâmetros informados!','Erro',mtError,[mbOk],0);
   end;
   Screen.Cursor := crDefault;
end;

end.
