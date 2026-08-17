//*******************************************************************************************************
//N. Sol..........: SOL 126124 / SOL 126125
//N. Kintana......: KTN 656907 / KTN 656908
//Data............: 01/02/2012
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
//Descrição.......: Cadastro de Linhas para Relatório
//*******************************************************************************************************
Unit fCadVigenciaMT;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
   IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
   uMensErro, uCtrlNormaVigente, uCtrlParametrosRelatorio, Db, DBClient, uCMClientDataSet,
   uCmSqlParams, uCtrlTipoRelatorio, uCmTypes;

Const MSG001 = 'O(s) Campo(s): %S é(são) de preenchimento obrigatório!';
Const MSG002 = 'A data de início da vigência é inválida' + #13 + 'A nova vigência deve ser maior que a vigência anterior!';

Type
   TfrmCadNormaVigencia = Class(TfrmOkCancelar)
      lblTipoRelatAss: TLabel;
      dbclTipoRelat: TwwDBLookupCombo;
      lblNormaAss: TLabel;
      lblVigenciaASS: TLabel;
      dedVigencia: TCMDateTimePicker;
      edNome: TEdit;
      cdsVigencia: TCMClientDataSet;
      cdsTipoRelatorio: TCMClientDataSet;
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure edNomeKeyPress(Sender: TObject; Var Key: Char);
   Protected
      Function ValidarCampos: Boolean;
      Function ValidarVigencia: Boolean;
   Public
      bIncluir: Boolean;
      oNormaVigente: TCtrlNormaVigente;
      oParametrosRelatorio: TCtrlParametrosRelatorio;
      oTipoRelatorio: TCtrlTipoRelatorio;

      { Public declarations }
   End;

Var frmCadNormaVigencia: TfrmCadNormaVigencia;

Implementation

Uses USistema, UDatabase, DBaseDados, fCadLInhasDACONMT;

{$R *.DFM}

Procedure TfrmCadNormaVigencia.bbtnConfirmarClick(Sender: TObject);
var isInserted : Boolean;
Begin

   If ValidarCampos() Then
      Begin
         If ValidarVigencia() Then
            Begin
               If bIncluir Then
                  oNormaVigente.IdNorma := 0;

               oNormaVigente.Descricao := edNome.Text;
               oNormaVigente.DataInicio := dedVigencia.Date;
               oNormaVigente.IdTipo := dbclTipoRelat.LookupTable.FieldbyName('IdTipo').asInteger;
               oNormaVigente.DescricaoTipo := dbclTipoRelat.LookupValue;
               oNormaVigente.DataFim := 0;//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908


               //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
               if (bbtnConfirmar.ModalResult = mrNone) then
               begin
                 bbtnConfirmar.ModalResult := mrOk;
                 bbtnConfirmar.Click;
               end
               else
                 bbtnConfirmar.ModalResult := mrNone;
               //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
            End;
      End;
end;      


Function TfrmCadNormaVigencia.ValidarCampos: Boolean;
Var sErro: String;
    isValida : Boolean;
Begin
   isValida := True;
   sErro := '';
   If (dedVigencia.Date = 0) Then
      Begin
         isValida := False;
         sErro := 'Data de Vigência, ';
      End;
   If (edNome.Text = EmptyStr) Then
      Begin
         isValida := False;
         sErro := sErro + 'Norma, ';
      End;
   If (dbclTipoRelat.Text = EmptyStr) Then
      Begin
         isValida := False;
         sErro := sErro + 'Tipo de Relatório';
      End;
   If Not isValida Then
      Begin
         sErro := Trim(sErro);
         If sErro[length(sErro)] = ',' Then
            sErro := Copy(sErro, 1, Length(sErro) - 1);
         MsgDlg(Format(MSG001, [sErro]), 'Erro', mtError, [mbOK], 0);
      End;

   result := isValida;
End;

Function TfrmCadNormaVigencia.ValidarVigencia: boolean;
Var oSql: TCMClientDataSet;
Begin
   oSql := TCMClientDataSet.Create(Nil);
   Try
      oSql.data := oNormaVigente.ProcurarNormaVigente(Trim(edNome.Text));
      Result := oSql.IsEmpty;
      If Not Result Then
         Begin
            Result := (oSql.FieldByName('Datafim').AsDateTime > dedVigencia.Date) Or
               (oSql.FieldByName('DataFim').AsDateTime = 0);
            oNormaVigente.IdNorma := oSql.FieldByName('IdNorma').asInteger;
         End
   Finally
      oSql.Close;
      FreeAndNil(oSql);
   End;
End;

Procedure TfrmCadNormaVigencia.edNomeKeyPress(Sender: TObject; Var Key: Char);
Begin
   Inherited;
   If (Key In ['A'..'Z', 'a'..'z', '0'..'9', '.', ',', '-', '_', #32, 'ç', 'Ç',
      '"', #39, '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '=', '|',
         '\', ',', ';', '<', '>', ':', '?', '/', '{', '}', '[', ']', '´', '`',
         '~', '^', '°', 'ª']) Then
      If length(edNome.Text) >= 200 Then
         key := #0;
End;

End.


