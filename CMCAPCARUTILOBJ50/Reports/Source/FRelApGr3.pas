// Daniel Simões - pendência 15387 e 15388 - 10/01/2006
//    Adicionado o campo CODEXTERNO da tabela CENTRESPON e exibido na combo
//    dblcCentroRespon.
// -----------------------------------------------------------------------------
// André Tavares - pendência 16330 - 03/05/2004 - inserido os joins abaixo na query do montaselect
//DOCUMENTO.CODTIPDOC = TIPODOCRECPAG.CODTIPDOC
//TIPODOCRECPAG.FLGIMPRIMEAP IS NULL OR TIPODOCRECPAG.FLGIMPRIMEAP = 'S'
//Marcus Oliveira - Pendencia 23593 14/12/2006 Não permitir seguir para o relatório sem os parametros preenchidos.

unit FRelApGr3;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, wwdbedit,
   MontaSelect, Db, DBTables, Wwquery, wwdblook, ComCtrls, uModulo,
   wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao, CmParamReport,
   DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra;

type
   TFrmRelApGr3 = Class(TfrmParamReports_Padrao)
      msDoc: TMontaSelect;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      lblCentroRespon: TLabel;
      Label1: TLabel;
      dblcCentroRespon: TwwDBLookupCombo;
      DateEdit1: TCMDateTimePicker;
      RadioGroup1: TRadioGroup;
      Panel1: TPanel;
      Label2: TLabel;
      bbtnSeleciona: TBitBtn;
      MemDocs: TMemo;
      SqlAux: TCMSqlParams;
      CdsAux: TCMClientDataSet;
      SqlCentroRespon: TCMSqlParams;
      CdsCentroRespon: TCMClientDataSet;

      procedure bbtnSelecionaClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations

   public   // Public declarations

      doc : String;

   end;



var
  FrmRelApGr3: TFrmRelApGr3;



implementation

uses
  udatabase, usistema, DBaseDados, umenserro, uString;

{$R *.DFM}



procedure TFrmRelApGr3.bbtnSelecionaClick(Sender: TObject);
begin
   inherited;
   if (msDoc.Executar = MrOk) then
   begin
      doc := MsDoc.ValoresChave[0];

      MemDocs.Lines.Add(' Nº Ap: ............ ' + MsDoc.ValoresChave[9]);
      MemDocs.Lines.Add(' Nº Documento: ..... ' + MsDoc.ValoresChave[7]);
      MemDocs.Lines.Add(' Complemento: ...... ' + MsDoc.ValoresChave[1]);
      MemDocs.Lines.Add(' Data Vencimento: .. ' + MsDoc.ValoresChave[2]);
      MemDocs.Lines.Add(' Data Programada: .. ' + MsDoc.ValoresChave[3]);
      MemDocs.Lines.Add(' Operacao: ......... ' + MsDoc.ValoresChave[4]);
      MemDocs.Lines.Add(' Data Emissão: ..... ' + MsDoc.ValoresChave[5]);
      MemDocs.Lines.Add(' Valor: ............ ' + MsDoc.ValoresChave[6]);
      MemDocs.Lines.Add(' Razao Social: ..... ' + MsDoc.ValoresChave[8]);
   end;
end;



procedure TFrmRelApGr3.FormCreate(Sender: TObject);
begin
   inherited;

   msDoc.Filtro.Add('Documento.RECPAG = ''' + ParamIntegra.RecPag + '''                             ');
   msDoc.Filtro.Add('Documento.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   msDoc.Filtro.Add('Documento.CODTIPDOC in                                                         ' +
     '(SELECT CODTIPDOC                                                              ' +
     ' FROM TIPODOCRECPAG a                                                          ' +
     ' WHERE                                                                         ' +
     '     a.RECPAG = ''' + ParamIntegra.RecPag + ''' and                            ' +
     '     not exists (select 1                                                      ' +
     '                 from UsuarioxTpdocto b                                        ' +
     '                 where                                                         ' +
     '                    recpag = ' + #39 + ParamIntegra.RecPag + #39 + ' and       ' +
     '                    b.idusuario = ' + IntToStr(Sistema.IdUsuario) + ')         ' +
     ' UNION                                                                         ' +
     ' SELECT CODTIPDOC                                                              ' +
     ' FROM TIPODOCRECPAG a                                                          ' +
     ' WHERE a.RECPAG = ''' + ParamIntegra.RecPag + ''' and                          ' +
     '       exists (select 1                                                        ' +
     '               from UsuarioxTpdocto b                                          ' +
     '               where recpag = ' + #39 + ParamIntegra.RecPag + #39 + ' and      ' +
     '                     a.codtipdoc = b.codtipdoc and                             ' +
     '                     b.idusuario = ' + IntToStr(Sistema.IdUsuario) + '))       ');

   // Verificar

   if Modulo.CodDocumento = 0 then
   begin
      with SqlCentroRespon do
      begin
        SQL.Text := 'SELECT ' +
          'CODCENTRORESPON, ' +
          'NOME, ' +
          'ANALITICOSINTET, ' +
          'CODCENTROCUSTO ' +
          'FROM ' +
          'CENTRESPON ' +
          'WHERE ' +
          'IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' and ' +
          'CODCENTRORESPON <> ''9999999999'' ' +
          'ORDER BY ' +
          'CODCENTRORESPON';
        Open;
      end;
   end;
end;



procedure TFrmRelApGr3.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if (trim(doc) = '') and (trim(dblcCentroRespon.text) = '') and (trim(DateEdit1.text) = '') then
   begin
      MsgDlg('Faltam parâmetros para seleção de documentos Selecionar Documento(s).', 'Erro', mtError, [mbOk], 0);
      Repaint;
      //Marcus Oliveira P.23593 14/12/2006  Caso não seja preenchido os parametros não deixar sair da tela.
      ModalResult := mrNone;

   end
   else
   begin
      if MsgDlg('Exibir as informações da Contabilização?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         Cmp_Padrao.ParamValues[1].AsBoolean := True;
      end
      else
      begin
         Cmp_Padrao.ParamValues[1].AsBoolean := False;
      end;

     Cmp_Padrao.ParamValues[0].AsString := Doc;
     Cmp_Padrao.ParamValues[2].AsString := dblcCentroRespon.LookupValue;
     Cmp_Padrao.ParamValues[3].AsString := DateEdit1.text;
     Cmp_Padrao.ParamValues[4].AsString := IntToStr(RadioGroup1.itemindex);
   end;
end;



end.

