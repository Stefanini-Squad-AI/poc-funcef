unit fCompoeValoresRI_TelaA;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 10/05/2007
// Pendência   :
// Descricao   : Revisão da tela inteira.
//------------------------------------------------------------------------------


interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwriched, Wwdotdot, Wwdbcomb, Mask,
   wwdbedit, Grids, Wwdbigrd, Wwdbgrid, Spin, Db, Wwdatsrc, DBTables,
   Wwquery, TREdit, wwdblook, CMDBLookupCombo, MontaSelect, Provider,
   DBClient,  uCmSqlParams, Menus, FTelaAut, Wwdbspin, wwclient;

type
   TfrmCompoeValoresRI_TelaA = class(TfrmOkCancelar)
    GrpBxPesquisaHistorico: TGroupBox;
     GroupBox1: TGroupBox;
     wwDBGrid2: TwwDBGrid;
     qryBenefbfciario: TwwQuery;
     dsHistrubsal: TwwDataSource;
     qryBenefbfciarioPARTICIPANTE: TStringField;
     qryBenefbfciarioNUMPROCINSS: TStringField;
     qryBenefbfciarioIDPESSOA: TFloatField;
     qryPlano: TwwQuery;
     btnImprimir: TBitBtn;
     BitBtn1: TBitBtn;
     Label1: TLabel;
     lblRegistros: TLabel;
     Label2: TLabel;
     lblTempo: TLabel;
     BitBtn2: TBitBtn;
     qryBenefbfciarioIDBENEFICIO: TFloatField;
     gboxTipoTratamento: TRadioGroup;
     qryBenefbfciarioPLANO: TStringField;
     lblMes: TLabel;
    cbxMes: TComboBox;
     seAno: TSpinEdit;
    BtnFiltrar: TBitBtn;
     cdsBenefbfciario: TwwClientDataSet;
     dspHistrubsal: TDataSetProvider;
    GrpBxPesquisaAssociado: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtNUMPROCINSS: TEdit;
    edtNome: TEdit;
    BtnEncontrarAssociado: TBitBtn;

     procedure qryBenefbfciarioBeforeOpen(DataSet: TDataSet);
     procedure wwDBGrid2DblClick(Sender: TObject);
     procedure BtnFiltrarClick(Sender: TObject);
     procedure qryBenefbfciarioAfterOpen(DataSet: TDataSet);
     procedure BtnEncontrarAssociadoClick(Sender: TObject);
     procedure cbxMesChange(Sender: TObject);

   private  // Private declarations
     sAnoMesCobranca : String;
     sIdPessoa       : String;

     dTempo          : Real;
   public   // Public declarations

   end;

var frmCompoeValoresRI_TelaA: TfrmCompoeValoresRI_TelaA;

implementation
{$R *.DFM}
uses uMensErro, UAdmPrev, fCompoeValoresRI;

procedure TfrmCompoeValoresRI_TelaA.wwDBGrid2DblClick(Sender: TObject);
begin
  inherited;

  if qryBenefbfciario.IsEmpty then Exit;

  // determina o tipo de tratamento de acordo com o groupbox
  case gboxTipoTratamento.ItemIndex of
    0:   // Benefício da CEF
      begin
        Application.CreateForm(TfrmCompoeValoresRI, frmCompoeValoresRI);
        frmCompoeValoresRI.TelaChamadora := 0;

        frmCompoeValoresRI.AbreProcessoParticipante(qryBenefBfciario.FieldByName('IDPESSOA').AsString,
                                                    qryBenefBfciario.FieldByName('IDBENEFICIO').AsString,
                                                    sAnoMesCobranca,
                                                    qryBenefBfciario.FieldByName('NUMPROCINSS').AsString
                                                    );

         frmCompoeValoresRI.Show;
      end;

      1: // Benefíco de Outro posto
      begin
         MsgDlg('Para esta opção não haverá tratamento.' + #13 +
                'Se desejar, selecione um dos modelos de impressão de ' + #13 +
                'Ofício para envio ao órgão responsável.', 'Informação', mtInformation, [mbOk], 0);
         Repaint;
      end;

   end;
end;



procedure TfrmCompoeValoresRI_TelaA.BtnFiltrarClick(Sender: TObject);
begin
   inherited;

  if sAnoMesCobranca = '' then
  begin
    ShowMessage('Preencha o Ano e Mês de Referência');
    Repaint;
    Exit;
  end;

  qryBenefbfciario.Close;
  qryBenefbfciario.ParamByname('MESREFERENCIA').AsString := sAnoMesCobranca;
  qryBenefbfciario.Open;

end;



procedure TfrmCompoeValoresRI_TelaA.qryBenefbfciarioBeforeOpen(DataSet: TDataSet);
begin
   inherited;
   dTempo := Now;
end;



procedure TfrmCompoeValoresRI_TelaA.qryBenefbfciarioAfterOpen(DataSet: TDataSet);
begin
   inherited;
   dTempo               := Now - dTempo;
   lblTempo.Caption     := TimeToStr(dTempo);
   lblRegistros.Caption := IntToStr(DataSet.RecordCount);
end;    

procedure TfrmCompoeValoresRI_TelaA.BtnEncontrarAssociadoClick(Sender: TObject);
begin
  inherited;

   if not(qryBenefbfciario.Active) then Exit;

   if edtNUMPROCINSS.Text <> ''
   then if qryBenefbfciario.Locate('NUMPROCINSS', edtNUMPROCINSS.Text, []) then Exit;

   if edtNome.Text <> ''
   then qryBenefbfciario.Locate('PARTICIPANTE', edtNome.Text, [loPartialKey]);

end;

procedure TfrmCompoeValoresRI_TelaA.cbxMesChange(Sender: TObject);
begin
  inherited;

   sAnoMesCobranca := FormatFloat('0000', seAno.Value) + '/' +
                      FormatFloat('00', (cbxMes.ItemIndex + 1));

end;



end.