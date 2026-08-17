// Alterações:
{ --------------------------------------------------------------------------------------------------
Data      : 03.10.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 23375
Descrição : Tive de tratar na tela o resultado da função (PodeCancelarOC) que verifica se é possível cancelar a OC.
            Alterei também a função PodeCancelarOC na uctrlOrdemCompra.
------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 08/06/2005
Autor     : Rodolpho da Silva
Pendencia : 19276
Descrição : Colocar nesta tela um campo que mostra o valor total da oc.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - (MontaSelect)
Data      : 21/05/2004
Autor     : André Pontes
Pendencia : 16659
Descrição : Criada a coluna
            DECODE(IT.FLGITEMATENDIDO, 'T', 'Recebido', DECODE(IT.FLGITEMATENDIDO, 'C', 'Cancelado',
            DECODE(NVL(IT.QTDERECEBIDA, 0), 0, 'Pendente', 'Atendido Parcialmente'))) AS STATUS
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// inclusão da variável bGeraProc para compatibilização com fontes do Igor (FDias - 13.10.2003
// pendência 15181 - FDias - 14.10.2003
---------------------------------------------------------------------------------------------------}

unit FMTCancelaOC;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   Db, Wwdatsrc, Mask, TB97Ctls, DBClient, uCMClientDataSet,
   uCtrlOrdemCompra, MontaSelect, DBTables, uCtrlResXComp,
   uCtrlAlmoxCompra;

type
   TFrmMTCancelaOC = class(TfrmSairAjuda)
      Dock972: TDock97;
      Label5: TLabel;
      Toolbar971: TToolbar97;
      btnCancela: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      edNumOC: TDBEdit;
      dsOC: TwwDataSource;
      dsItemOC: TwwDataSource;
      dsPrazoEntOC: TwwDataSource;
      dsPrazoPagOC: TwwDataSource;
      dsAgregItemOC: TwwDataSource;
      plnItem: TPanel;
      Splitter1: TSplitter;
      PgOC: TPageControl;
      TabItem: TTabSheet;
      GrdItem: TwwDBGrid;
      TabOBS: TTabSheet;
      memObsOC: TDBMemo;
      PgItem: TPageControl;
      TabPrazoEnt: TTabSheet;
      GrdPrazoEnt: TwwDBGrid;
      TabPrazoPag: TTabSheet;
      GrdPrazoPag: TwwDBGrid;
      TabAgreg: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      TabObsItem: TTabSheet;
      Panel1: TPanel;
      Pendente: TLabel;
      Panel3: TPanel;
      Recebido: TLabel;
      Label6: TLabel;
      Panel2: TPanel;
      CdsOC: TCMClientDataSet;
      cdsItemOC: TCMClientDataSet;
      cdsPrazoEntOC: TCMClientDataSet;
      cdsPrazoPagOC: TCMClientDataSet;
      cdsAgregItemOC: TCMClientDataSet;
      cdsSCItemOC: TCMClientDataSet;
      MontaSelect: TMontaSelect;
      cdsSCIOrigem: TCMClientDataSet;
      Panel4: TPanel;
      Label4: TLabel;
      dbreOBS: TDBRichEdit;
    Panel5: TPanel;
    edProcesso: TDBEdit;
    Label3: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    edData: TDBEdit;
    edFron: TDBEdit;
    Label1: TLabel;

      procedure dsItemOCDataChange(Sender: TObject; Field: TField);
      procedure sbtnProcurarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure btnCancelaClick(Sender: TObject);
      procedure GrdItemDblClick(Sender: TObject);
      procedure GrdItemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure GrdItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure FormDestroy(Sender: TObject);
      procedure cdsItemOCAfterOpen(DataSet: TDataSet);
      procedure GrdItemUpdateFooter(Sender: TObject);


   private  // Private declarations

      OrdemCompra   : TCtrlOrdemCompra;

      CtrlResXComp : TCtrlResXComp;
      CtrlAlmoxCompra: TCtrlAlmoxCompra;
      cdsAlmoxCompra: TCMClientDataSet;
      procedure Sel(NumOC : LongInt);
      procedure SelFilhos(IdItemOC : Double);
      procedure ViewSCI(IdItemOC : Double);
      procedure ViewCotacao(IdItemOC : Double);


   public   // Public declarations


   end;



var
  FrmMTCancelaOC: TFrmMTCancelaOC;



implementation
{$R *.DFM}
{ TFrmMTCancelaOC }
uses
   uModulo, DBaseDados, uSistema, uMensErro, FMTViewSCI, FMTViewCotacao;



procedure TFrmMTCancelaOC.Sel(NumOC: Integer);
begin
   cdsOC.Data          := OrdemCompra.ListOC(NumOC , True);

   cdsItemOC.Data      := OrdemCompra.GetItemOC(Sistema.IdEmpresa,NumOC);

   TField(cdsItemOC.FieldByName('STATUS')).Alignment := taCenter;

   cdsPrazoEntOC.Data  := OrdemCompra.GetPrazoEntregaOC(NumOC);
   cdsPrazoPagOC.Data  := OrdemCompra.GetPrazoPgtoOC(NumOC);
   cdsAgregItemOC.Data := OrdemCompra.GetAgregItemOC(NumOC);
   cdsSCItemOC.Data    := OrdemCompra.GetSCItemOC(NumOC);

   cdsItemOC.First;

   cdsSCIOrigem.Data   := OrdemCompra.ListSCIOrigem(cdsItemOC.FieldByName('IDITEMOC').AsFloat);
end;



procedure TFrmMTCancelaOC.SelFilhos(IdItemOC: Double);
begin
   cdsPrazoEntOC.Filtered  := False;
   cdsPrazoEntOC.Filter    := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsPrazoEntOC.Filtered  := True;

   cdsPrazoPagOC.Filtered  := False;
   cdsPrazoPagOC.Filter    := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsPrazoPagOC.Filtered  := True;

   cdsAgregItemOC.Filtered := False;
   cdsAgregItemOC.Filter   := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsAgregItemOC.Filtered := True;

   cdsSCItemOC.Filtered    := False;
   cdsSCItemOC.Filter      := 'IDITEMOC = ' + FloatToStr(IdItemOC);
   cdsSCItemOC.Filtered    := True;
end;



procedure TFrmMTCancelaOC.dsItemOCDataChange(Sender: TObject; Field: TField);
begin
   inherited;

   if dsItemOC.DataSet.State = dsBrowse then
   begin
      SelFilhos(cdsItemOC.FieldByName('IDITEMOC').AsFloat);
   end;
end;



procedure TFrmMTCancelaOC.sbtnProcurarClick(Sender: TObject);
begin
   inherited;

   MontaSelect.Executar;
   Repaint;

   if MontaSelect.RetornouValor then Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;



procedure TFrmMTCancelaOC.FormShow(Sender: TObject);
begin
   inherited;

   btnCancela.Visible := Modulo.sFormCancela = 'S';

   if Modulo.sFormCancela = 'S' then
   begin
      Self.Caption := 'Cancelamento de O.C.';
      GrdItem.Hint := 'Duplo clique para cancelar o item';
   end
   else
   begin
      Self.Caption := 'Consulta O.C.';
      GrdItem.Hint := 'Duplo qlique para Vizualizar a S.C.I.' + #13 +
                      'Clicque com o botão direito para Vizualizar a Cotação.';
   end;
end;



procedure TFrmMTCancelaOC.FormCreate(Sender: TObject);
begin
   inherited;
   OrdemCompra := TCtrlOrdemCompra.Create;
   OrdemCompra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);

   CtrlResXComp := TCtrlResXComp.Create;
   CtrlResXComp.InitializeAs(OrdemCompra);

   CtrlAlmoxCompra := TCtrlAlmoxCompra.Create;
   CtrlAlmoxCompra.InitializeAs(OrdemCompra);

   cdsAlmoxCompra := TCMClientDataSet.Create(Self);
   cdsAlmoxCompra.Data := CtrlAlmoxCompra.GetParamCompras(Sistema.IdEmpresa);

   MontaSelect.Filtro.Add('OC.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   Sel(-1);
end;



procedure TFrmMTCancelaOC.btnCancelaClick(Sender: TObject);
var
   bGeraProc : Boolean;
begin
   inherited;

   if not(cdsOC.IsEmpty) then
     begin
       if OrdemCompra.PodeCancelarOC(cdsOC.FieldByName('NUMOC').AsFloat) then
       begin
          if MsgDlg('Confirma o cancelamento da O.C. TODA','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
               Repaint;


               if cdsOC.FieldByName('FLGCOMSEMCOT').AsString = 'C' then
                 begin
                    bGeraProc := MsgDlg('Deseja gerar um novo processo de compra','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes;
                    REpaint;
                 end;

               if not(OrdemCompra.CancelaOC(Sistema.IdEmpresa,cdsOC.FieldByName('NUMOC').AsFloat,bGeraProc)) then
                 begin
                    MsgDlg(OrdemCompra.MessageInfo,'Erro',mtError,[mbOK],0);
                    Repaint;
                 end
               else
                 begin
                    MsgDlg(OrdemCompra.MessageInfo,'Informação',mtInformation,[mbOK],0);

                    if cdsAlmoxCompra.FieldByName('FLGORCAMENTO').AsString = 'S' then
                    begin
                       Sel(cdsOC.FieldByName('NUMOC').AsInteger);

                       if OrdemCompra.QtdCompromissos(OrdemCompra.BuscaIdReserva(cdsOC.FieldByName('NUMOC').AsFloat)) = 0 then
                         MsgDlg(OrdemCompra.MessageInfo, 'Informação', mtInformation, [mbOK], 0)
                       else
                         MsgDlg(OrdemCompra.MessageInfo +#13+
                                '' +#13+
                                'A RESERVA vinculada a este Processo possui mais de uma' +#13+
                                'OC/COMPROMISSO relacionados e os documentos vinculados a esta OC' +#13+
                                '(RESERVA, SCI e PROCESSO) não poderão ser alterados.' +#13+
                                '' +#13+
                                'Se necessário, faça uma NOVA RESERVA e um NOVO PROCESSO para' +#13+
                                'o(s) item(s) desta OC cancelada!',
                                'Informação', mtWarning, [mbOK], 0);
                    end;
                 end;
            end;
          Repaint;
       end
         else
           begin
              if ( not OrdemCompra.OcJaCancelada ) then
                 MsgDlg('Já existem itens recebidos. Não é possível o cancelamento da O.C. TODA. Cancele somente os itens possíveis.','Aviso',mtWarning,[mbOk],0);
              Repaint;
           end;
     end;
end;



procedure TFrmMTCancelaOC.GrdItemDblClick(Sender: TObject);
var
   bGeraProc : Boolean;
begin
   inherited;

   if Modulo.sFormCancela = 'S' then
   begin
      if cdsItemOC.FieldByName('STATUS').AsString = 'P' then
      begin
         if MsgDlg('Confirma o cancelamento do Item ' + cdsItemOC.FieldByName('DESCRICAO').AsString, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
            Repaint;

            bGeraProc := cdsOC.FieldByName('FLGCOMSEMCOT').AsString = 'C';

            if cdsOC.FieldByName('FLGCOMSEMCOT').AsString = 'C' then
            begin
               bGeraProc := MsgDlg('Deseja gerar um novo processo de compra','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes;
               Repaint;
            end;

            if not(OrdemCompra.CancelaItemOC(Sistema.IdEmpresa,cdsItemOC.FieldByName('IDITEMOC').asFloat,bGeraProc)) then
            begin
               MsgDlg(OrdemCompra.MessageInfo, 'Erro', mtError, [mbOk], 0);
               Repaint;
            end
            else
            begin
               MsgDlg(OrdemCompra.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
               Repaint;
            end;

            Sel(cdsOC.FieldByName('NUMOC').AsInteger);
         end;

         Repaint;
      end;
   end
   else
   begin
      ViewSCI(cdsItemOC.FieldByName('IDITEMOC').AsFloat);
   end;
end;



procedure TFrmMTCancelaOC.GrdItemCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if (Field.FieldName = 'STATUS') then
   begin
      if Field.AsString = 'P' then
         ABrush.Color  := $0080FFFF
      else
      if Field.AsString = 'C' then
         ABrush.Color  := $008080FF
      else
      if Field.AsString = 'R' then
         ABrush.Color  := $0080FF80
      else
      if Field.AsString = 'A' then
         ABrush.Color  := ClAqua;

      if Highlight then AFont.Color := clBlack;
   end;
end;



procedure TFrmMTCancelaOC.ViewCotacao(IdItemOC: Double);
begin
   Application.CreateForm(TFrmMTViewCotacao,FrmMTViewCotacao);
   FrmMTViewCotacao.PlnDescProd.Caption  := cdsItemOC.FieldByName('DESCRICAO').AsString;
   FrmMTViewCotacao.CodProcesso          := cdsSCIOrigem.FieldByName('CODPROCESSO').AsFloat;
   FrmMTViewCotacao.IdProcxArt           := cdsSCIOrigem.FieldByName('IDPROCXART').AsFloat;
   FrmMTViewCotacao.ShowModal;
end;



procedure TFrmMTCancelaOC.ViewSCI(IdItemOC: Double);
begin
   Application.CreateForm(TFrmMTViewSCI,FrmMTViewSCI);
   FrmMTViewSCI.lbStatus.Caption    := cdsItemOC.FieldByName('STATUS').AsString;
   FrmMTViewSCI.lbCodigo.Caption    := cdsItemOC.FieldByName('CODARTIGO').AsString;
   FrmMTViewSCI.lbDescricao.Caption := cdsItemOC.FieldByName('DESCRICAO').AsString;
   FrmMTViewSCI.cdsSCI.Data := OrdemCompra.ListSCIOrigem(IdItemOC);
   FrmMTViewSCI.ShowModal;
end;



procedure TFrmMTCancelaOC.GrdItemMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;

   if Modulo.sFormCancela <> 'S' then
   begin
      if ssRight in Shift then
      begin
         ViewCotacao(cdsItemOC.FieldByName('IDITEMOC').AsFloat);
      end;
   end;
end;



procedure TFrmMTCancelaOC.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlResXComp);
  FreeAndNil(OrdemCompra);
  FreeAndNil(CtrlAlmoxCompra);
  inherited;
end;




procedure TFrmMTCancelaOC.cdsItemOCAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALORUN')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('TOTAL')).DisplayFormat   := '#,##0.00;(#,##0.00)';
end;




procedure TFrmMTCancelaOC.GrdItemUpdateFooter(Sender: TObject);
var
   CdsAux: TCMClientDataSet;
   fTotal: Double;

begin
  inherited;
  try
    CdsAux := TCMClientDataSet.Create(nil);
    fTotal := 0;

    CdsAux.Data := cdsItemOC.Data;

    while not CdsAux.Eof do
    begin
       fTotal := fTotal + CdsAux.FieldByName('TOTAl').AsFloat;

       CdsAux.Next;
    end;

    (sender as TwwDBGrid).ColumnByName('TOTAL').FooterValue := FormatFloat('#,##0.00', fTotal);
  finally
     FreeAndNil(CdsAux);
  end;
end;

end.
