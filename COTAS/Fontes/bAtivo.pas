unit bAtivo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   Db, DBTables, Wwquery, FOkCancelar;

type
   TbusAtivo = class(TfrmOkCancelar)
      PageControl: TPageControl;
      TabSheet1: TTabSheet;
      Panel2: TPanel;
      Panel3: TPanel;
      Panel4: TPanel;
      Panel5: TPanel;
      Panel6: TPanel;
      Panel7: TPanel;
      Panel8: TPanel;
      Panel9: TPanel;
      Panel10: TPanel;
      Panel11: TPanel;
      Label1: TLabel;
      cboNome: TComboBox;
      edtNome: TEdit;
      chkNome: TCheckBox;
      TabSheet2: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      btnOK: TBitBtn;
      qryResultado: TwwQuery;
      dsResultado: TDataSource;
      ToolbarSep972: TToolbarSep97;
      qryResultadoIDATIVOCOTA: TFloatField;
      qryResultadoIDCARTEIRASPC: TFloatField;
      qryResultadoNOMEATIVO: TStringField;

      procedure bbtnCancelarClick(Sender: TObject);
      procedure PageControlChange(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure btnOKClick(Sender: TObject);
      procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      FRetornouValor : Boolean;
      sSQL           : String;

      procedure MontaQuery;
      procedure MontaSelect;
      procedure MontaWhere;
      function  MontaFiltro: Boolean;

   public   // Public declarations

      ValoresChave : array[0..3] of String;
      Filtro       : String;
      Tabelas      : String;

      property RetornouValor : Boolean   read FRetornouValor  write FRetornouValor;

   end;

var
  busAtivo: TbusAtivo;



implementation
{$R *.DFM}
uses
   uSistema;



procedure TbusAtivo.bbtnCancelarClick(Sender: TObject);
begin
   qryResultado.Close;
end;


procedure TbusAtivo.MontaQuery;
begin
   MontaSelect;
   MontaWhere;

   with qryResultado do
   begin
      SQL.Text := sSQL;
      SQL.SaveToFile(Sistema.TempDir + 'Cota-BuscaAtivo');
      Open;
   end;
end;



procedure TbusAtivo.MontaSelect;
begin
   sSQL :=
   'SELECT '                                                                           + #13 +
   '   ATC.IDATIVOCOTA, ATC.IDCARTEIRASPC, '                                           + #13 +
   '   CASE '                                                                          + #13 +
   '      WHEN (ATC.IDFUNDOINVEST     IS NOT NULL) THEN FIV.DESCFUNDOINVEST '          + #13 +
   '      WHEN (ATC.IDINVESTIMENTO    IS NOT NULL) THEN INV.DESCINVESTIMENTO '         + #13 +
   '      WHEN (ATC.IDTIPOCONTREMPTMO IS NOT NULL) THEN TCE.TCEDESCRICAO '             + #13 +
   '      WHEN (ATC.IDIMOVEL          IS NOT NULL) THEN IMO.IMONOME '                  + #13 +
   '      WHEN (ATN.IDATIVOCOTA       IS NOT NULL) THEN ATN.DESCRICAO '                + #13 +
   '   ELSE '                                                                          + #13 +
   '      ATC.DESCRICAO '                                                              + #13 +
   '   END AS NOMEATIVO '                                                              + #13 +

   'FROM '                                                                             + #13 +
   '   ATIVOCOTA        ATC, '                                                         + #13 +
   '   TIPOCONTREMPTMO  TCE, '                                                         + #13 +
   '   IMOVEL           IMO, '                                                         + #13 +
   '   INVESTIMENTO     INV, '                                                         + #13 +
   '   FUNDOINVEST      FIV, '                                                         + #13 +
   '   ( '                                                                             + #13 +
   '   SELECT '                                                                        + #13 +
   '      IDATIVOCOTA, DESCRICAO '                                                     + #13 +
   '   FROM '                                                                          + #13 +
   '      ATIVOCOTA '                                                                  + #13 +
   '   WHERE '                                                                         + #13 +
   '          IDFUNDOINVEST     IS NULL '                                              + #13 +
   '      AND IDINVESTIMENTO    IS NULL '                                              + #13 +
   '      AND IDTIPOCONTREMPTMO IS NULL '                                              + #13 +
   '      AND IDIMOVEL          IS NULL '                                              + #13 +
   '      AND DESCRICAO         IS NOT NULL '                                          + #13 +
   '   ) ATN '                                                                         + #13;
end;



procedure TbusAtivo.MontaWhere;
begin
   sSQL := sSQL +
   'WHERE '                                                                            + #13;

   if not(MontaFiltro) then
   begin
      if MessageDlg('Nenhum filtro foi especificado para a pesquisa. Isso pode levar algum tempo de processamento!. ', mtConfirmation, [mbYes,mbNo],0) = mrNo then
      begin
         PageControl.ActivePageIndex := 0;
         Exit;
      end;
   end;

   sSQL := sSQL +
   '   AND ATC.IDIMOVEL                = IMO.IDIMOVEL(+) '                             + #13 +
   '   AND ATC.IDINVESTIMENTO          = INV.IDINVESTIMENTO(+) '                       + #13 +
   '   AND ATC.IDFUNDOINVEST           = FIV.IDFUNDOINVEST(+) '                        + #13 +
   '   AND ATC.IDTIPOCONTREMPTMO       = TCE.IDTIPOCONTREMPTMO(+) '                    + #13;

   sSQL := sSQL +
   'ORDER BY '                                                                         + #13 +
   '   CASE '                                                                          + #13 +
   '      WHEN (ATC.IDFUNDOINVEST     IS NOT NULL) THEN FIV.DESCFUNDOINVEST '          + #13 +
   '      WHEN (ATC.IDINVESTIMENTO    IS NOT NULL) THEN INV.DESCINVESTIMENTO '         + #13 +
   '      WHEN (ATC.IDTIPOCONTREMPTMO IS NOT NULL) THEN TCE.TCEDESCRICAO '             + #13 +
   '      WHEN (ATC.IDIMOVEL          IS NOT NULL) THEN IMO.IMONOME '                  + #13 +
   '      WHEN (ATN.IDATIVOCOTA       IS NOT NULL) THEN ATN.DESCRICAO '                + #13 +
   '   ELSE '                                                                          + #13 +
   '      ATC.DESCRICAO '                                                              + #13 +
   '   END '                                                                           + #13;
end;



function TbusAtivo.MontaFiltro: Boolean;
begin
   if edtNome.Text <> '' then
   begin
      Result := True;

      case cboNome.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkNome.Checked then sSQL := sSQL +
         '       UPPER(TCE.TCEDESCRICAO)     LIKE ''' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(IMO.IMONOME)          LIKE ''' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(INV.DESCINVESTIMENTO) LIKE ''' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(FIV.DESCFUNDOINVEST)  LIKE ''' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(ATN.DESCRICAO)        LIKE ''' + UpperCase(edtNome.Text)  + '%''' + #13
         else sSQL := sSQL +
         '       TCE.TCEDESCRICAO            LIKE ''' + edtNome.Text             + '%''' + #13 +
         '   AND IMO.IMONOME                 LIKE ''' + edtNome.Text             + '%''' + #13 +
         '   AND INV.DESCINVESTIMENTO        LIKE ''' + edtNome.Text             + '%''' + #13 +
         '   AND FIV.DESCFUNDOINVEST         LIKE ''' + edtNome.Text             + '%''' + #13 +
         '   AND ATN.DESCRICAO               LIKE ''' + edtNome.Text             + '%''' + #13;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         1:
         if chkNome.Checked then sSQL := sSQL +
         '       UPPER(TCE.TCEDESCRICAO)     LIKE ''%' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(IMO.IMONOME)          LIKE ''%' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(INV.DESCINVESTIMENTO) LIKE ''%' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(FIV.DESCFUNDOINVEST)  LIKE ''%' + UpperCase(edtNome.Text)  + '%''' + #13 +
         '   AND UPPER(ATN.DESCRICAO)        LIKE ''%' + UpperCase(edtNome.Text)  + '%''' + #13
         else sSQL := sSQL +
         '       TCE.TCEDESCRICAO            LIKE ''%' + edtNome.Text             + '%''' + #13 +
         '   AND IMO.IMONOME                 LIKE ''%' + edtNome.Text             + '%''' + #13 +
         '   AND INV.DESCINVESTIMENTO        LIKE ''%' + edtNome.Text             + '%''' + #13 +
         '   AND FIV.DESCFUNDOINVEST         LIKE ''%' + edtNome.Text             + '%''' + #13 +
         '   AND ATN.DESCRICAO               LIKE ''%' + edtNome.Text             + '%''' + #13;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         2:
         if chkNome.Checked then sSQL := sSQL +
         '       UPPER(TCE.TCEDESCRICAO)     = ' + QuotedStr(UpperCase(edtNome.Text))  + #13 +
         '   AND UPPER(IMO.IMONOME)          = ' + QuotedStr(UpperCase(edtNome.Text))  + #13 +
         '   AND UPPER(INV.DESCINVESTIMENTO) = ' + QuotedStr(UpperCase(edtNome.Text))  + #13 +
         '   AND UPPER(FIV.DESCFUNDOINVEST)  = ' + QuotedStr(UpperCase(edtNome.Text))  + #13 +
         '   AND UPPER(ATN.DESCRICAO)        = ' + QuotedStr(UpperCase(edtNome.Text))  + #13
         else sSQL := sSQL +
         '       TCE.TCEDESCRICAO            = ' + QuotedStr(edtNome.Text)             + #13 +
         '   AND IMO.IMONOME                 = ' + QuotedStr(edtNome.Text)             + #13 +
         '   AND INV.DESCINVESTIMENTO        = ' + QuotedStr(edtNome.Text)             + #13 +
         '   AND FIV.DESCFUNDOINVEST         = ' + QuotedStr(edtNome.Text)             + #13 +
         '   AND ATN.DESCRICAO               = ' + QuotedStr(edtNome.Text)             + #13;
         // ----------------------------------------------------------------------------------------

      end;
   end
   else
   begin
      Result := False;
   end;
end;



procedure TbusAtivo.PageControlChange(Sender: TObject);
begin
   inherited;

   bbtnConfirmar.Visible := PageControl.ActivePageIndex = 0;
   btnOK.Visible         := PageControl.ActivePageIndex = 1;

   Application.ProcessMessages;
end;



procedure TbusAtivo.bbtnSairClick(Sender: TObject);
begin
   FRetornouValor := False;
   QryResultado.Close;
   Close;
end;



procedure TbusAtivo.btnOKClick(Sender: TObject);
var
   i : Integer;
begin
   for i := 0 to 5 do ValoresChave[i] := '';

   if FRetornouValor then
   begin
      ValoresChave[0]  := qryResultadoIDATIVOCOTA.AsString;
      ValoresChave[1]  := qryResultadoNOMEATIVO.AsString;
      ValoresChave[2]  := qryResultadoIDCARTEIRASPC.AsString;
   end;

   busAtivo.Close;
end;



procedure TbusAtivo.wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   if Key = VK_RETURN then btnOKClick(Self);
end;



procedure TbusAtivo.FormShow(Sender: TObject);
begin
   inherited;

   cboNome.ItemIndex := 0;
end;



end.
