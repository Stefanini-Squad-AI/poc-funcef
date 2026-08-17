unit FCargaFCRT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables, Wwtable, Db, Wwquery,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBGrids;


type
   TfrmExecCargaFCRT = class(TFrmOkCancelarImob)
    qryContrato: TwwQuery;
    tblContrato: TwwTable;
    dsContrato: TwwDataSource;
    dsParcela: TwwDataSource;
    wwQuery2: TwwQuery;
    tblParcela: TwwTable;
    tblContratoMATRIC: TStringField;
    tblContratoSEQ: TStringField;
    tblContratoPROTOC: TStringField;
    tblContratoTIPO: TStringField;
    tblContratoCONVENIO: TStringField;
    tblContratoPARC_TOTAL: TStringField;
    tblContratoDIGITO: TStringField;
    tblContratoIENCARG: TStringField;
    tblContratoJUROS: TFloatField;
    tblContratoEMISSAO: TStringField;
    tblContratoAPROVACAO: TStringField;
    tblContratoCONCESSAO: TStringField;
    tblContratoPRIM_VCTO: TStringField;
    tblContratoULT_VCTO: TStringField;
    tblContratoULT_CAPIT: TStringField;
    tblContratoCANCEL: TStringField;
    tblContratoMOT_CANCEL: TStringField;
    tblContratoAUT_ESPEC: TStringField;
    tblContratoCONTAB: TStringField;
    tblContratoULT_PARC: TStringField;
    tblContratoCRED_APROV: TFloatField;
    tblContratoJUROS_APRO: TFloatField;
    tblContratoCORR_MONET: TFloatField;
    tblContratoTX_ADM: TFloatField;
    tblContratoVLR_BRUTO: TFloatField;
    tblContratoCOTA_QUIT: TFloatField;
    tblContratoSLD_FINANC: TFloatField;
    tblContratoSLD_ABERTO: TFloatField;
    tblContratoPRIM_PARC: TFloatField;
    tblContratoOUTR_PARC: TFloatField;
    tblContratoNUM_FAT: TStringField;
    tblContratoPATROC: TStringField;
    tblContratoCLS_PART: TStringField;
    tblContratoSIT_PART: TStringField;
    tblContratoBRANCO: TStringField;
    qryContratoCONVENIO: TStringField;
    qryContratoCOUNTOFCONVENIO: TIntegerField;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;

      procedure bbtnConfirmarClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmExecCargaFCRT: TfrmExecCargaFCRT;



implementation
{$R *.DFM}



procedure TfrmExecCargaFCRT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   (* 1º - Carga de Concessão *)

   (* 2º - Carga de Parcelas *)

   try
{
      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      memResult.Clear;
      memErro.Clear;

      // ----------------------------------------------------------------------------------------
      (* Seleciona os contratos Ativos *)
      if not(SelecionaContratosGeracao) then begin

         EscondeEspera;
         Repaint;
         MsgDlg('Não há Parcelas a gerar com os filtros escolhidos. ' + #13 +
                '(Pode não haver Contratos ativos que satisfaçam os filtros escolhidos ou '+
                'as Parcelas desses Contratos já podem ter sido geradas).' + #13 + #13 +
                'Será iniciada agora a integração contábil dos itens previamente criados.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

      end else begin

         (* Itera pelos contratos, gerando (ou não) as parcelas *)
         if not(ProcessaContratos) then Exit;

      end;
      // ----------------------------------------------------------------------------------------

      if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) ) then begin

         iResultContab := Contabiliza;

         case iResultContab of
            -2: MsgDlg('Não foram encontrados Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
            -1: MsgDlg('Não foi possivel abrir a seleção de Itens a contabilizar!', 'Empréstimo', mtWarning, [mbOk], 0);
         end;
         Repaint;

      end;

      MsgDlg('Geração de Parcelas finalizada.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;

      ntbPrincipal.PageIndex := 1;
}
   finally
//      HabilitaBotoes;
   end;
end;



end.
