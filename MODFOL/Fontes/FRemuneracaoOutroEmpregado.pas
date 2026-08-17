unit FRemuneracaoOutroEmpregado;
//***************************************************************************************
//Rotina             : bbtnOkDetClick
//N. SIG..........   : 38475.60432
//Data da Alteração: : 19/12/2017
//Alteração Form:    : fRemuneracaoOutroempregado
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Retirada da verificação das datas entre os períodos de vigência.
//***************************************************************************************
//Nº SIG...........: 20810
//Data da Alteração: 01/09/2016
//Responsável......: André Imakawa
//Descrição........: Alterar o campo Mês para "Vigência", com dia, mês e ano.
//                   Buscar dados do Cadastro de Favorecido para preencher "CNPJ" e ]
//                   "Nome Fantasia"
//***************************************************************************************
//Nº SOL...........: 250385/17479
//Nº PPM...........: 960979
//Data da Alteração: 22/07/2015
//Responsável......: Higor Nayde Ferreira
//Descrição........: Inclusão da Funcionalidade Transações -> Remuneração - Outro Empregador.
//***************************************************************************************
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, TREdit, wwdbedit,
  wwdblook, Wwdbdlg, DBCtrls,uCtrlOutroEmpregado,Provider,uCMTypes,Gauges,
  dxCntner, dxEditor, dxEdLib, dxDBELib, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker; // Andre Imakawa - SIG 20810

type
  Tbotao = (opInserir, opAlterar, opSalvar); // Andre Imakawa - SIG 20810
  TfrmRemuneracaoOutroEmpregado = class(TFrmCadastroMestreDetMT)
    lblDocumento: TLabel;
    dbeMatricula: TwwDBEdit;
    dbedNomeFantasia: TDBEdit;
    lblNome: TLabel;
    CdsDet: TCMClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label4: TLabel;
    dbedVlrRemuneracao: TDBRealEdit;
    Label3: TLabel;
    edtNumero: TdxDBMaskEdit;
    dsMes: TwwDataSource;
    cdsMes: TCMClientDataSet;
    edtDataInicio: TCMDateTimePicker; // Andre Imakawa - SIG 20810
    lbla: TLabel; // Andre Imakawa - SIG 20810
    edtDataFim: TCMDateTimePicker; // Andre Imakawa - SIG 20810
    btnEmpresa: TBitBtn; // Andre Imakawa - SIG 20810
    MontaSelectEmpresa: TMontaSelect;
    CdsAux: TClientDataSet; // Andre Imakawa - SIG 20810

    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);// Andre Imakawa - SIG 20810
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);// Andre Imakawa - SIG 20810
    private
       CtrlOutroEmpregado : TCtrlOutroEmpregado;
      { Private declarations }

       procedure FormataColunaValor;// Andre Imakawa - SIG 20810 
    public
      sIdPessoa :String;
      function ValidaPeriodo(pTipo: Tbotao): Boolean;// Andre Imakawa - SIG 20810
      { Public declarations }
    end;

var
  frmRemuneracaoOutroEmpregado: TfrmRemuneracaoOutroEmpregado;
  iIdPessoa, iIdEmpresa: Integer;
  fvalor: Double;
  dtInicio, dtFim: TDateTime;

implementation

uses uCtrlPadroes,uAutorizacao,uMensErro;

{$R *.DFM}

procedure TfrmRemuneracaoOutroEmpregado.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
 // dbeMatricula.text := MontaSelect.ValoresChave[1];
 // dbedNomeFantasia.text:=  MontaSelect.ValoresChave[0];
end;

procedure TfrmRemuneracaoOutroEmpregado.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOutroEmpregado := TCtrlOutroEmpregado.Create;
  CtrlOutroEmpregado.InitializeAs(Padroes);
  CtrlOutroEmpregado.CdsOutroEmpregado := CdsDet;
  Cds.Data := CtrlOutroEmpregado.ListPessoa('0');
  CdsDet.Data :=  CtrlOutroEmpregado.CarregaGrid('0');
  //cdsMes.Data :=  CtrlOutroEmpregado.Meses;  // Andre Imakawa - SIG 20810
end;

procedure TfrmRemuneracaoOutroEmpregado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlOutroEmpregado);
end;



procedure TfrmRemuneracaoOutroEmpregado.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
      Cds.Data := CtrlOutroEmpregado.ListPessoa(MontaSelect.ValoresChave[4]);
      CdsDet.Data :=  CtrlOutroEmpregado.CarregaGrid(MontaSelect.ValoresChave[4]);
      FormataColunaValor();// Andre Imakawa - SIG 20810
      
      sIdPessoa :=  MontaSelect.ValoresChave[4];
  end;
end;

procedure TfrmRemuneracaoOutroEmpregado.bbtnConfirmarClick(
  Sender: TObject);
begin
  // Andre Imakawa - SIG 20810 - Inicio
  if not (ValidaPeriodo(opSalvar)) then
  begin
    bbtnCancelarDet.Click;
  end
  else
  begin
    inherited;
    CmeCadastroFind(Self);
  end;
  // Andre Imakawa - SIG 20810 - Fim                      
end;

procedure TfrmRemuneracaoOutroEmpregado.CmeCadastroApplyEdit(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlOutroEmpregado.Gravar;

  if not(Accept) then
  begin
    MsgDlg(CtrlOutroEmpregado.MessageInfo, 'Erro', mtError, [mbOK], 0);
  end;
end;

procedure TfrmRemuneracaoOutroEmpregado.bbtnOkDetClick(Sender: TObject);
begin
  if (dbedVlrRemuneracao.Value < 0) or ((dbedVlrRemuneracao.Text = '') or (dbedVlrRemuneracao.Text = '0,00')) then
  begin
        MsgDlg('Preencha o valor da Remuneração','Aviso', mtWarning, [mbOk], 0);
        dbedVlrRemuneracao.SetFocus;
        Exit;
  end;
  // Andre Imakawa - SIG 20810 - Inicio
  if ((edtDataFim.text <> '') and  (edtDataInicio.Text = '')) then
  begin
    MsgDlg('Com a Data Fim de Vigência preenchida, torna-se obrigatório o preenchimento da Data Início de Vigência','Aviso', mtWarning, [mbOk], 0);
    edtDataInicio.SetFocus;
    Exit;
  end;

  if ((edtDataInicio.Text <> '') and (edtDataFim.Text <>'')) then
    if (edtDataInicio.Date > edtDataFim.Date) then
    begin
      MsgDlg('Data Fim de Vigência deverá ser maior ou igual a Data Início de Vigência.','Aviso', mtWarning, [mbOk], 0);
      edtDataInicio.SetFocus;
      Exit;
    end;

  //Cássio Rovaroto - SIG nº 38475.60432 - Início
  //if (dsDet.State in [dsInsert]) then
  //begin
  //  if CdsAux.RecordCount > 0 then
  //  begin
  //
  //    if edtDataInicio.text <> '' then
  //    begin
  //      CdsAux.Filter := 'INICIOVIGENCIA <= ' + QuotedStr(edtDataInicio.text)+ ' AND FIMVIGENCIA >= ' + QuotedStr(edtDataInicio.text);
  //      CdsAux.Filtered := True;
  //      if CdsAux.RecordCount > 0 then
  //      begin
  //        MsgDlg('Data de Início de Vigência deverá ser maior que a Data Fim de Vigência do registro anterior.','Aviso', mtWarning, [mbOk], 0);
  //        edtDataInicio.SetFocus;
  //        CdsAux.Filter := '';
  //        CdsAux.Filtered := False;
  //        Exit;
  //      end;
  //    end;
  //
  //    if edtDataFim.text <> '' then
  //    begin
  //      CdsAux.Filter := 'INICIOVIGENCIA <= ' + QuotedStr(edtDataFim.text)+ ' AND FIMVIGENCIA >= ' + QuotedStr(edtDataFim.text);
  //      CdsAux.Filtered := True;
  //      if CdsAux.RecordCount > 0 then
  //      begin
  //        MsgDlg('Data Fim de Vigência deverá ser menor que a Data Início de Vigência do próximo registro.','Aviso', mtWarning, [mbOk], 0);
  //        edtDataFim.SetFocus;
  //        CdsAux.Filter := '';
  //        CdsAux.Filtered := False;
  //        Exit;
  //      end;
  //    end;
  //
  //    CdsAux.Filter := '';
  //    CdsAux.Filtered := False;
  //  end;
  //end
  //else
  //begin
  //  CdsAux.First;
  //  while not CdsAux.eof do
  //  begin
  //    if not((iIdPessoa =  CdsAux.FieldByName('IDPESSOA').AsInteger) and (iIdEmpresa =  CdsAux.FieldByName('IDEMPRESA').AsInteger) and
  //        (fvalor  =  CdsAux.FieldByName('VLREMUNOE').AsFloat) and (dtInicio =  CdsAux.FieldByName('INICIOVIGENCIA').AsDateTime)) then
  //    begin
  //
  //     if edtDataInicio.text <> '' then
  //      begin
  //        if ((CdsAux.FieldByName('INICIOVIGENCIA').AsDateTime <= edtDataInicio.Date)and(CdsAux.FieldByName('FIMVIGENCIA').AsDateTime >= edtDataInicio.Date))  then
  //        begin
  //          MsgDlg('Data de Início de Vigência deverá ser maior que a Data Fim de Vigência do registro anterior.','Aviso', mtWarning, [mbOk], 0);
  //          edtDataInicio.SetFocus;
  //          Exit;
  //        end;
  //      end;
  //
  //      if edtDataFim.text <> '' then
  //      begin
  //        if (CdsAux.FieldByName('FIMVIGENCIA').AsString = '') then
  //          begin
  //            if (CdsAux.FieldByName('INICIOVIGENCIA').AsDateTime <= edtDataFim.Date)  then
  //            begin
  //              MsgDlg('Data Fim de Vigência deverá ser menor que a Data Início de Vigência do próximo registro.','Aviso', mtWarning, [mbOk], 0);
  //              edtDataFim.SetFocus;
  //              Exit;
  //            end;
  //          end
  //        else
  //          begin
  //           if ((CdsAux.FieldByName('INICIOVIGENCIA').AsDateTime <= edtDataFim.Date)and(CdsAux.FieldByName('FIMVIGENCIA').AsDateTime >= edtDataFim.Date))then
  //           begin
  //              MsgDlg('Data Fim de Vigência deverá ser menor que a Data Início de Vigência do próximo registro.','Aviso', mtWarning, [mbOk], 0);
  //              edtDataFim.SetFocus;
  //              Exit;
  //            end;
  //          end;
  //      end;
  //
  //    end;
  //    CdsAux.Next;
  //  end;
  //end;
  //Cássio Rovaroto - SIG nº 38475.60432 - Fim

  if (edtDataInicio.Text <> '') then
    CdsDet.FieldByName('VIGENCIA').AsString := edtDataInicio.Text + ' a ' + edtDataFim.Text;
  

  CdsDet.FieldByName('IDPESSOA').AsString := sIdPessoa;
  inherited;
  // Andre Imakawa - SIG 20810 - Fim
end;
// Andre Imakawa - SIG 20810 - Inicio
procedure TfrmRemuneracaoOutroEmpregado.btnEmpresaClick(Sender: TObject);
begin
  inherited;

  MontaSelectEmpresa.Executar;

  if MontaSelectEmpresa.RetornouValor then
  begin
    CdsDet.FieldByName('IDEMPRESA').AsString := MontaSelectEmpresa.ValoresChave[4];
    CdsDet.FieldByName('RAZAOSOCIAL').AsString := UpperCase(MontaSelectEmpresa.ValoresChave[0]);
    CdsDet.FieldByName('CPF_CNPJ').AsString :=  CtrlOutroEmpregado.RetornaMascaraCPFCNPJ(MontaSelectEmpresa.ValoresChave[2]);
  end;
end;
// Andre Imakawa - SIG 20810 - Fim
// Andre Imakawa - SIG 20810 - Inicio
procedure TfrmRemuneracaoOutroEmpregado.FormataColunaValor;
var
   i : integer;
begin
  for i := 0 to cdsDet.FieldCount -1 do
     if  cdsDet.Fields[i].Datatype = ftFloat then
         TFloatField(cdsDet.Fields[i]).DisplayFormat := '#,##0.00';
end;
// Andre Imakawa - SIG 20810 - Fim
// Andre Imakawa - SIG 20810 - Inicio
procedure TfrmRemuneracaoOutroEmpregado.sbtnInsDetClick(Sender: TObject);
begin
  cdsAux.CloneCursor(CdsDet, false, true);
  if not (ValidaPeriodo(opInserir)) then
  begin
    bbtnCancelarDet.Click;
  end
  else
    inherited;
end;
// Andre Imakawa - SIG 20810 - Fim
// Andre Imakawa - SIG 20810 - Inicio
function TfrmRemuneracaoOutroEmpregado.ValidaPeriodo(pTipo: Tbotao): Boolean;
var iCont: integer;
begin

  Result := True;
  if pTipo = opInserir then
  begin
      if CdsDet.RecordCount <= 0 then
        result := True
      else
        begin
          CdsDet.First;
          while not CdsDet.Eof do
          begin
            if CdsDet.FieldByName('FIMVIGENCIA').AsString = '' then
              begin
                MsgDlg('Antes de cadastrar um novo registro, preencha a Data Fim de Vigência do registro anterior','Aviso', mtWarning, [mbOk], 0);
                Result := False;
                Exit;
              end;
              CdsDet.next;
          end;
        end;
  end;
  if pTipo = opSalvar then
  begin
      if CdsDet.RecordCount <= 0 then
        result := True
      else
        begin
          CdsDet.First;
          iCont := 0;
          while not CdsDet.Eof do
          begin
            if CdsDet.FieldByName('FIMVIGENCIA').AsString = '' then
              begin
                iCont := iCont + 1;
              end;
            CdsDet.next;
          end;

          if iCont > 1 then
          begin
             MsgDlg('Permitido apenas um registro sem a Data Fim de Vigência preenchida. Verifique.','Aviso', mtWarning, [mbOk], 0);
             Result := False;
             Exit;
          end;
        end;
  end;
end;
// Andre Imakawa - SIG 20810 - Fim

// Andre Imakawa - SIG 20810 - Inicio
procedure TfrmRemuneracaoOutroEmpregado.sbtnAltDetClick(Sender: TObject);
begin
  cdsAux.CloneCursor(CdsDet, false, true);
  iIdPessoa :=  CdsDet.FieldByName('IDPESSOA').AsInteger;
  iIdEmpresa :=  CdsDet.FieldByName('IDEMPRESA').AsInteger;
  fvalor  :=  CdsDet.FieldByName('VLREMUNOE').AsFloat;
  dtInicio :=  CdsDet.FieldByName('INICIOVIGENCIA').AsDateTime;
  inherited;

end;
// Andre Imakawa - SIG 20810 - Fim
end.
