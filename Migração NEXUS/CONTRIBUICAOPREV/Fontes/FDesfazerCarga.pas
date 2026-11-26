//***************************************************************************************
//***********************-----HISTÓRICO DE ALTERAÇÕES-----*******************************
//***************************************************************************************
//***************************************************************************************
//Nº SOL:            145044
//Nº KINTANA         966308
//Data da Alteração: 12/05/2014
//Alteração Form:    Criação do form
//Responsável:       Tadeu Passos/ Douglas Siqueira / Higor Nayde / William Santana
//Descrição:         Benefício Saldado e FAB
//**************************************************************************************

unit FDesfazerCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Grids, Wwdbigrd, dBaseDados,
  Wwdbgrid, UMensErro, uSistema;

type
  TfrmDesfazerCarga = class(TfrmOkCancelar)
    dbgrdBenefSaldado: TwwDBGrid;
    qryImportados: TwwQuery;
    updImportados: TUpdateSQL;
    dsImportados: TDataSource;
    qryHistorico: TwwQuery;
    updHistorico: TUpdateSQL;
    qryDesfazerCarga: TwwQuery;
    qryDesfazerBenef: TwwQuery;
    qryImportadosSEL: TFloatField;
    qryImportadosQTDE_REGISTROS: TFloatField;
    qryImportadosDATAIMPORTACAO: TDateTimeField;
    qryImportadosDATASALDAMENTO: TDateTimeField;
    qryImportadosIDCARGAARQUIVO: TFloatField;
    qryHistoricoIDHSTALTBENEFSALDFAB: TFloatField;
    qryHistoricoIDPESSOA: TFloatField;
    qryHistoricoIDTITULAR: TFloatField;
    qryHistoricoTIPO: TStringField;
    qryHistoricoCAMPO: TStringField;
    qryHistoricoVALORANTERIOR: TStringField;
    qryHistoricoVALORALTERADO: TStringField;
    qryHistoricoMESREFERENCIA: TStringField;
    qryDesfazerBenefIDBENEFSALDFAB: TFloatField;
    qryDesfazerBenefIDCARGAARQUIVO: TFloatField;
    qryDesfazerBenefIDPESSOA: TFloatField;
    qryDesfazerBenefIDTITULAR: TFloatField;
    qryDesfazerBenefMESREFERENCIA: TStringField;
    qryDesfazerBenefVALORINDICE: TFloatField;
    qryDesfazerBenefINDICE: TStringField;
    qryDesfazerBenefINDICEACUMULADO: TFloatField;
    qryDesfazerBenefBENEFSALDADO: TFloatField;
    qryDesfazerBenefSALDOFAB: TFloatField;
    qryDesfazerCargaIDCARGABENEFSALDFAB: TFloatField;
    qryDesfazerCargaIDCARGAARQUIVO: TFloatField;
    qryDesfazerCargaIDPESSOA: TFloatField;
    qryDesfazerCargaIDTITULAR: TFloatField;
    qryDesfazerCargaDATASALDAMENTO: TDateTimeField;
    qryDesfazerCargaDATAIMPORTACAO: TDateTimeField;
    qryDesfazerCargaPCS: TStringField;
    qryDesfazerCargaNOMECARGO: TStringField;
    qryDesfazerCargaVALORCARGO: TFloatField;
    qryDesfazerCargaPERCENTATS: TFloatField;
    qryDesfazerCargaVALORATS: TFloatField;
    qryDesfazerCargaVPGRATSEMADICTEMPSERV: TFloatField;
    qryDesfazerCargaVPGIPTEMPOSERV: TFloatField;
    qryDesfazerCargaVPGIPSEMSALCOMFUNC: TFloatField;
    qryDesfazerCargaVPEXBH: TFloatField;
    qryDesfazerCargaADICCOMP: TFloatField;
    qryDesfazerCargaADICINCORP: TFloatField;
    qryDesfazerCargaADICNOTURNO: TFloatField;
    qryDesfazerCargaADICINSALU: TFloatField;
    qryDesfazerCargaADICPERI: TFloatField;
    qryDesfazerCargaINCORPJUD: TFloatField;
    qryDesfazerCargaCODCARGOCOMIS: TFloatField;
    qryDesfazerCargaNOMECARGOCOMIS: TStringField;
    qryDesfazerCargaVALORCARGOCOMIS: TFloatField;
    qryDesfazerCargaSALPART: TFloatField;
    qryDesfazerCargaBENEFICIOSALDADO: TFloatField;
    qryDesfazerCargaPERCENTPBE: TFloatField;
    qryDesfazerCargaULTIMOMESPROC: TStringField;
    qryDesfazerCargaDATAELEGIBILIDADE: TDateTimeField;
    qryDesfazer: TwwQuery;
    qryDesfazerIDTITULAR: TFloatField;
    qryDesfazerIDPESSOA: TFloatField;
    qryDesfazerIDCARGAARQUIVO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesfazerCarga: TfrmDesfazerCarga;

implementation

uses fCargaArquivo;

{$R *.DFM}

procedure TfrmDesfazerCarga.bbtnConfirmarClick(Sender: TObject);
var
  i : Integer;
  haSelecionado : Boolean;
begin
  if qryImportados.RecordCount > 0 then
    begin
      if MsgDlg('Deseja apagar os dados dos registros selecionados?','Atenção',mtInformation,[mbYes,mbNo],0) = mrYes then
        begin
          haSelecionado := False;

          if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
          Try
            qryImportados.DisableControls;
            qryImportados.First;
            while not qryImportados.Eof do
              begin
                if qryImportadosSEL.AsInteger = 1 then
                begin
                  haSelecionado := True;

                  // Antes de apagar grava o histórico, portanto, aqui pega os registros que terão histórico
                  qryDesfazer.Close;
                  qryDesfazer.ParamByName('IDCARGAARQUIVO').AsInteger := qryImportadosIDCARGAARQUIVO.AsInteger;
                  qryDesfazer.Prepare;
                  qryDesfazer.Open;

                  qryDesfazer.First;

                  qryHistorico.Open;
                  while not qryDesfazer.Eof do
                    begin
                      // Granvando o Histórico de todos os resgistros que serão apagados

                        begin
                          qryHistorico.Insert;
                          qryHistoricoIDPESSOA.AsInteger  := qryDesfazerIDPESSOA.AsInteger;
                          qryHistoricoIDTITULAR.AsInteger := qryDesfazerIDTITULAR.AsInteger;;
                          qryHistoricoTIPO.AsString  := 'E'; // "E" de Exclusão
                          qryHistoricoCAMPO.AsString := '';
                          qryHistoricoVALORANTERIOR.AsString := '';
                          qryHistoricoVALORALTERADO.AsString := '';
                          qryHistoricoMESREFERENCIA.AsString := '';
                          qryHistorico.Post;
                        end;
                        qryDesfazer.next;
                    end;
                  qryHistorico.ApplyUpdates;

                  qryDesfazerCarga.Close;
                  qryDesfazerCarga.ParamByName('IDCARGAARQUIVO').AsInteger := qryImportadosIDCARGAARQUIVO.AsInteger;
                  qryDesfazerCarga.ExecSQL;

                  qryDesfazerBenef.Close;
                  qryDesfazerBenef.ParamByName('IDCARGAARQUIVO').AsInteger := qryImportadosIDCARGAARQUIVO.AsInteger;
                  qryDesfazerBenef.ExecSQL;

                end;                              
                qryImportados.Next;
              end;
            qryImportados.EnableControls;

            if haSelecionado then
              begin
                if dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Commit;
                MsgDlg('Todos os registros foram excluídos com sucesso.','Sucesso',mtInformation,[mbOk],0);
              end
            else
            begin
              MsgDlg('Nenhum registro foi selecionado.','Atenção',mtInformation,[mbOk],0);
              exit;
            end
          except
            if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;
          end;
        end;
    end
  else
    MsgDlg('Não há registro para ser excluído.','Atenção',mtInformation,[mbOk],0);

    bbtnSair.Click ;
end;

procedure TfrmDesfazerCarga.FormShow(Sender: TObject);
begin
  qryImportados.Close;
  qryImportados.Open;
end;                       

procedure TfrmDesfazerCarga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCargaArquivo.Enabled := true;
end;

end.
