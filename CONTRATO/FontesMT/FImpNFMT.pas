{
=====================================================================================
 N. Chamado....: WO33944
 Dt Alteração..: 09/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .(.dfm) Ajustando o padrão da mascara atual do CNPJ (mskedMascaras)
                  para a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
=====================================================================================
}
unit FImpNFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, ComCtrls, Db,
  Wwdatsrc, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlNotaFiscal, uCtrlListTercContratos, uExtensoCM, uGimp, uObjHASAR;

type
  TfrmImpNFMT = class(TfrmSairAjuda)
    dsContratos: TwwDataSource;
    pgcTiposImp: TPageControl;
    tbsImpComum: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    mskedNumNota: TMaskEdit;
    dblcModeloNF: TwwDBLookupCombo;
    edNatServicos: TEdit;
    edCondEspeciais: TEdit;
    dblcImposto: TwwDBLookupCombo;
    mskedMascaras: TMaskEdit;
    edDescImposto: TEdit;
    edPrestacaoServ: TEdit;
    dtpDataEmissao: TCMDateTimePicker;
    chbExibeIdentImposto: TCheckBox;
    tbsImpFiscal: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    cbModeloImpFiscal: TComboBox;
    redPorta: TRealEdit;
    gbCabecalho: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edCabLinha1: TEdit;
    edCabLinha2: TEdit;
    gbRodape: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edRodLinha1: TEdit;
    edRodLinha2: TEdit;
    grdContratos: TwwDBGrid;
    spAux: TCMSqlParams;
    cdsAlteradores: TCMClientDataSet;
    cdsModelosNF: TCMClientDataSet;
    cdsContratos: TCMClientDataSet;
    Extenso: TExtensoCM;
    btnImprimir: TBitBtn;
    cdsAux: TCMClientDataSet;
    cdsCompNF: TCMClientDataSet;
    cdsDadosNF: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mskedNumNotaChange(Sender: TObject);
    procedure dblcModeloNFChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure grdContratosTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }

    Gimp          : TGimp;
    Hasar         : TImpressao;
    bUsaImpFiscal : Boolean;
    rAliquota     : Double;

    CtrlNotaFiscal : TCtrlNotaFiscal;
    CtrlListTercContratos : TCtrlListTercContratos;

    function ImprimeNF(iNumNota:Integer): Boolean;
    function ImprimeNFImpFiscal: Boolean;
    function GeraTotalNota: Real;    
    function GeraTotalImposto(rIDPessoa, rIDContrato, rCodAlterador, rIDParcela: Double;
                              dDataVencParc: TDateTime; var rAliquota: Double): Real;
    procedure GeraMultiplasLinhas(sTexto: String; iColuna, iLinha, iTamanho, iNumMaxLinhas: Integer;
                                  TextoNF: TStringList);
    function AlinhaTexto(sTexto,sAlinhamento: String; iTamanho: Integer): String;
    procedure PosicionaValor(var Txt: TStringList; iColuna,iLinha: Integer; Valor: String);
    procedure TruncaTexto(var sTexto, sRestoTexto: String; iTamanho: Integer);
    function Replicate(sPadrao: String; iNumVezes: Integer): String;
    function JuntaString(sA,sB: String): String;
    function SubstCarEspeciais(sTexto: String): String;            
  public
    { Public declarations }
  end;

var
  frmImpNFMT: TfrmImpNFMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, Math, OleCtrls, ComObj;

procedure TfrmImpNFMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlNotaFiscal:=TCtrlNotaFiscal.Create;
   CtrlNotaFiscal.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlListTercContratos:=TCtrlListTercContratos.Create;
   CtrlListTercContratos.Initialize(dtmBaseDados.dbBaseDados,True);

   cdsContratos.Data:=CtrlNotaFiscal.ListContrImpNF(Sistema.IdEmpresa);
   cdsModelosNF.Data:=CtrlNotaFiscal.ListModeloNF(Sistema.IdEmpresa,0);
   cdsAlteradores.Data:=CtrlListTercContratos.ListAlterador(Sistema.IdEmpresa,'R');

   dtpDataEmissao.Date:=Date;
   Gimp:=TGImp.Create(Self);
   bUsaImpFiscal:=False;

   spAux.ClientDataSet:=cdsAux;
   spAux.SQL.Text:='SELECT FLGNFIMPFISCAL '+
                    'FROM PARAMCONTRATO '+
                    'WHERE (IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') ';
   spAux.Open;

   bUsaImpFiscal:=(cdsAux.FieldByName('FLGNFIMPFISCAL').AsString='S') ;
   cdsAux.Close;

   tbsImpComum.TabVisible:=not(bUsaImpFiscal);
   tbsImpFiscal.TabVisible:=bUsaImpFiscal;

   if not(bUsaImpFiscal) then
      pgcTiposImp.ActivePageIndex:=0
   else
      pgcTiposImp.ActivePageIndex:=1;
end;

procedure TfrmImpNFMT.FormDestroy(Sender: TObject);
begin
   inherited;
   Gimp.Free;
end;

procedure TfrmImpNFMT.mskedNumNotaChange(Sender: TObject);
begin
   inherited;
   btnImprimir.Enabled:=(Trim(mskedNumNota.Text)<>'');
end;

procedure TfrmImpNFMT.dblcModeloNFChange(Sender: TObject);
begin
   inherited;
   cdsCompNF.Close;
   cdsCompNF.Data:=CtrlNotaFiscal.ListCompImpNF(StrToFloat(dblcModeloNF.LookupValue));
end;

procedure TfrmImpNFMT.btnImprimirClick(Sender: TObject);
var
   iNumNotaFiscal   : Integer;
   bImprimiu        : Boolean;
   sEnderecoCliente : String;
begin
   iNumNotaFiscal:=0;
   if not(bUsaImpFiscal) then
    begin
       try
          iNumNotaFiscal:=StrToInt(Trim(mskedNumNota.Text));
       except
          MsgDlg('Número de Nota Fiscal Inválido !','Atenção',mtWarning,[mbOk],0);
          mskedNumNota.SetFocus;
          Exit;
       end;

       Gimp.MostraPrinterSetup:=True;
       if not(Gimp.Inicializar) then
        begin
           MsgDlg('Impressora não preparada','Atenção',mtWarning,[mbOk],0);
           Exit;
        end;

       cdsContratos.First;
       while not(cdsContratos.Eof) do
       begin
          bImprimiu:=False;
          //Testa se o Registro está marcado para impressão
          if cdsContratos.FieldByName('IMPRIMENOTA').AsString='S' then
           begin
              //Busca dados da NF
              cdsDadosNF.Close;
              cdsDadosNF.Data:=CtrlNotaFiscal.ListDadosImpNF(Sistema.IdEmpresa,
                                                  cdsContratos.FieldByName('IDCONTRATO').AsFloat,
                                                  cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime);
              cdsDadosNF.First;

              //A impressão da NF não está preparada para imprimir dados que ultrapassem a área de
              //detalhe da mesma
              if (cdsModelosNF.FieldByName('LinDetFinal').AsFloat-
                  cdsModelosNF.FieldByName('LinDetInicial').AsFloat-cdsDadosNF.RecordCount)<0 then
               begin
                  ShowMessage('Erro *** Linhas detalhes excedem comprimento máximo da área detalhe ***');
                  Exit;
               end;

               if ImprimeNF(iNumNotaFiscal) then
                begin
                   //Grava o Número da Nota Fiscal nos registros que a compõe
                   if not(CtrlNotaFiscal.GravaNumNF(Sistema.IdEmpresa,
                                         cdsContratos.FieldByName('IDCONTRATO').AsFloat,
                                         iNumNotaFiscal,Date,
                                         cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime)) then
                   begin
                      MsgDlg(CtrlNotaFiscal.MessageInfo,'Erro',mtError,[mbOk],0);
                      Exit;
                   end;

                   Inc(iNumNotaFiscal);
                   mskedNumNota.Text:=IntToStr(iNumNotaFiscal);
                end;
           end;
          cdsContratos.Next;
        end;
        Gimp.Finalizar;
        cdsContratos.Close;
        cdsContratos.Data:=CtrlNotaFiscal.ListContrImpNF(Sistema.IdEmpresa);
    end
   else
    begin
       if (Trim(cbModeloImpFiscal.Text)='') then
        begin
           MsgDlg('O Modelo de Impressora não foi informado','Atenção',mtWarning,[mbOk],0);
           cbModeloImpFiscal.SetFocus;
           Exit;
        end;
       if (redPorta.Value<1) then
        begin
           MsgDlg('Porta de impressora inválida','Atenção',mtWarning,[mbOk],0);
           redPorta.SetFocus;
           Exit;
        end;

       try
          Hasar:=TImpressao.Create(Trunc(redPorta.Value));
          try
             Hasar.Conectar(cbModeloImpFiscal.ItemIndex+1);
             Hasar.Inicializar;

             Hasar.Cabecalho[0]:=Trim(edCabLinha1.Text);
             Hasar.Cabecalho[1]:=Trim(edCabLinha2.Text);

             Hasar.Rodape[0]:=Trim(edRodLinha1.Text);
             Hasar.Rodape[1]:=Trim(edRodLinha2.Text);

             sEnderecoCliente:=cdsContratos.FieldByName('LOGRADOURO').AsString+' - '+
                               cdsContratos.FieldByName('BAIRRO').AsString+' - '+
                               cdsContratos.FieldByName('CIDADE').AsString+' - '+
                               cdsContratos.FieldByName('ESTADO').AsString;

             Hasar.DadosCliente(cdsContratos.FieldByName('RAZAOSOCIAL').AsString,
                                cdsContratos.FieldByName('CNPJ').AsString,
                                FACTURA_B,TIPO_CUIT,sEnderecoCliente);

             cdsContratos.First;
             while not(cdsContratos.Eof) do
             begin
                if cdsContratos.FieldByName('IMPRIMENOTA').AsString='S' then
                 begin
                    //Busca dados da NF
                    cdsDadosNF.Close;
                    cdsDadosNF.Data:=CtrlNotaFiscal.ListDadosImpNF(Sistema.IdEmpresa,
                                             cdsContratos.FieldByName('IDCONTRATO').AsFloat,
                                             cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime);
                    cdsDadosNF.First;

                    if ImprimeNFImpFiscal then
                     begin
                        //Grava o Número da Nota Fiscal nos registros que a compõe
                        iNumNotaFiscal:=Hasar.GetNumFatura(FACTURA_B);
                        if not(CtrlNotaFiscal.GravaNumNF(Sistema.IdEmpresa,
                                       cdsContratos.FieldByName('IDCONTRATO').AsFloat,
                                       iNumNotaFiscal,Date,
                                       cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime)) then
                         begin
                            MsgDlg(CtrlNotaFiscal.MessageInfo,'Erro',mtError,[mbOk],0);
                            Exit;
                         end;
                     end;
                 end;
                cdsContratos.Next;
             end;
             Hasar.Finalizar;
          finally
             Hasar.Destroy;
          end;

          cdsContratos.Close;
          cdsContratos.Data:=CtrlNotaFiscal.ListContrImpNF(Sistema.IdEmpresa);
       except
          on E:Exception do MsgDlg(E.Message,'Erro',mtError,[mbOk],0);
       end;
    end;
end;

function TfrmImpNFMT.ImprimeNF(iNumNota: Integer): Boolean;
var
   TxtNF               : TStringList;
   iColuna             : Integer;
   iLinha              : Integer;
   iLinhaAux           : Integer;
   sValor              : String;
   rTotalNota          : Real;
   rImposto            : Real;
   rValorLiq           : Real;
   sRestoTexto         : String;
   iNumMaxLinhas       : Integer;
   bLinhasDetalhe      : Boolean;
   bMostraIdentImposto : Boolean;
   PosicaoInicDetalhe  : TBookmark;
begin
   Result:=True;
   sRestoTexto:='';
   bMostraIdentImposto:=False;
   TxtNF:=TStringList.Create;
   try
      rTotalNota:=GeraTotalNota;
      rImposto:=0;
      if (Trim(dblcImposto.Text)<>'') then
          rImposto:=Abs(GeraTotalImposto(Sistema.IdEmpresa,
                                         cdsContratos.FieldByName('IDContrato').AsFloat,
                                         StrToFloat(dblcImposto.LookupValue),0,
                                         cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime,
                                         rAliquota));

      rValorLiq:=rTotalNota-rImposto;

      //Impressão das Linhas
      cdsDadosNF.First;
      iNumMaxLinhas:=cdsModelosNF.FieldByName('NUMLINHASNOTA').AsInteger;

      iLinha:=0;
      sValor:='';
      bLinhasDetalhe:=False;
      TxtNF.Clear;

      for iLinha:=1 to iNumMaxLinhas do
      begin
         if (iLinha>TxtNF.Count) then
            TxtNF.Add('')
         else
            sValor:=TxtNF.Strings[iLinha-1];

         if (iLinha<cdsModelosNF.FieldByName('LINDETINICIAL').AsInteger) or
            (iLinha>cdsModelosNF.FieldByName('LINDETFINAL').AsInteger) then
          begin
             //Linhas de Cabeçalho/Rodapé da Nota

             //Procura no Modelo da NF a Linha corrente
             cdsCompNF.First;
             if not(cdsCompNF.Locate('Linha',iLinha,[])) then Continue;

             //Loop para montagem da linha da Nota 
             while (cdsCompNF.FieldByName('Linha').AsInteger=iLinha) and
                   not(cdsCompNF.Eof) do
             begin
                iColuna:=cdsCompNF.FieldByName('Coluna').AsInteger;
                sValor:='';

                case cdsCompNF.FieldByName('IDCompNF').AsInteger of
                    1: sValor:=IntToStr(iNumNota); //Número da Nota
                    2: sValor:=edNatServicos.Text; //Natureza do Serviço
                    3: sValor:=FormatDateTime('dd/mm/yyyy',dtpDataEmissao.Date); //Data da Emissão
                    4: sValor:=FormatFloat('#,##0.00',rTotalNota); //Valor Total da Nota
                    5: sValor:=IntToStr(iNumNota); //Número da Nota
                    6: sValor:=FormatDateTime('dd/mm/yyyy',
                                             cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime); //Data de Vencimanto
                    7: sValor:='Desconto'; //Descontos
                    8: sValor:=edCondEspeciais.Text; //Condições Especiais
                    9: sValor:=cdsContratos.FieldByName('RAZAOSOCIAL').AsString; //Razão Social
                   10: sValor:=cdsContratos.FieldByName('LOGRADOURO').AsString; //Logradouro
                   11: sValor:=cdsContratos.FieldByName('BAIRRO').AsString; //Bairro
                   12: sValor:=cdsContratos.FieldByName('CIDADE').AsString; //Cidade
                   13: sValor:=cdsContratos.FieldByName('ESTADO').AsString; //Estado
                   14: sValor:=cdsContratos.FieldByName('CEP').AsString; //CEP
                   15: sValor:='Praça de Pagamento';
                   16: begin //CNPJ
                          sValor:=Trim(cdsContratos.FieldByName('CNPJ').AsString);
                          mskedMascaras.EditMask:='AA.AAA.AAA/AAAA-99;0; ';
                          mskedMascaras.Text:=sValor;
                          sValor:=mskedMascaras.EditText;
                       end;
                   17: begin //Inscrição Estadual/Municipal
                          sValor:='';

                          cdsAux.Close;
                          spAux.SQL.Text:='SELECT '+
                                           '   IE.NUMDOCUMENTO AS INSCESTADUAL, '+
                                           '   IE.MASCARA AS MASCARAE, '+
                                           '   IM.NUMDOCUMENTO AS INSCMUNICIPAL, '+
                                           '   IM.MASCARA AS MASCARAM '+
                                           'FROM '+
                                           '   (SELECT D.IDPESSOA,D.NUMDOCUMENTO, TD.MASCARA '+
                                           '    FROM DOCPESSOA D, TIPODOCPESSOA TD '+
                                           '    WHERE (D.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+
                                                     ') AND '+
                                           '          (D.IDDOCUMENTO = TD.IDDOCUMENTO) AND '+
                                           '          (D.IDDOCUMENTO IN (SELECT INSCESTADUAL '+
                                           '                             FROM PARAMGLOBAL '+
                                           '                             WHERE (IDPESSOA = '+
                                                FloatToStr(Sistema.IdEmpresa)+')))) IE, '+
                                           '   (SELECT D.IDPESSOA,D.NUMDOCUMENTO, TD.MASCARA '+
                                           '    FROM DOCPESSOA D, TIPODOCPESSOA TD '+
                                           '    WHERE (D.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+
                                                      ') AND '+
                                           '          (D.IDDOCUMENTO = TD.IDDOCUMENTO) AND '+
                                           '          (D.IDDOCUMENTO IN (SELECT INSCMUNICIPAL '+
                                           '                             FROM PARAMGLOBAL '+
                                           '                             WHERE (IDPESSOA = '+
                                                FloatToStr(Sistema.IdEmpresa)+')))) IM '+
                                           'WHERE '+
                                           '   (IE.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') AND '+
                                           '   (IE.IDPESSOA = IM.IDPESSOA) ';
                          spAux.Open;

                          if (Trim(cdsAux.FieldByName('INSCESTADUAL').AsString)<>'') then
                           begin
                              mskedMascaras.EditMask:=cdsAux.FieldByName('MASCARAE').AsString+';0; ';
                              mskedMascaras.Text:=cdsAux.FieldByName('INSCESTADUAL').AsString;
                           end
                          else
                           if (Trim(cdsAux.FieldByName('INSCMUNICIPAL').AsString)<>'') then
                            begin
                               mskedMascaras.EditMask:=cdsAux.FieldByName('MASCARAM').AsString+';0; ';
                               mskedMascaras.Text:=cdsAux.FieldByName('INSCMUNICIPAL').AsString;
                            end
                           else
                            begin
                               mskedMascaras.EditMask:='';
                               mskedMascaras.Text:='ISENTA';
                            end;

                          sValor:=mskedMascaras.EditText;
                       end;
                   18: begin //Extenso
                          Extenso.SetaMoedaPadrao;
                          Extenso.SetaIdiomaPadrao;
                          Extenso.Valor:=rTotalNota;
                          Extenso.Escreve;
                          sValor:=Extenso.LinhasExtenso.Linha1;
                       end;
                   24: sValor:=FormatFloat('#,##0.00',rTotalNota); //Total da Nota
                   25: sValor:=FormatFloat('#,##0.00',rImposto); //Imposto
                   26: sValor:=FormatFloat('#,##0.00',rValorLiq); //Valor Líquido
                   27: begin //Descrição do Imposto
                          sValor:=edDescImposto.Text;
                          if chbExibeIdentImposto.Checked then sValor:=sValor+' (*)';
                       end;
                   28: sValor:=edPrestacaoServ.Text; //Descrição de Prestação de Serviço
                end; //Fim Linhas de Cabeçalho/Rodapé da Nota

                if (Length(sValor)>cdsCompNF.FieldByName('TAMANHO').AsInteger) then
                    GeraMultiplasLinhas(sValor,iColuna,iLinha,
                                        cdsCompNF.FieldByName('TAMANHO').AsInteger,
                                        iNumMaxLinhas,TxtNF)
                else
                 begin
                    sValor:=AlinhaTexto(sValor,
                                        cdsCompNF.FieldByName('FLGALINHAMENTO').AsString,
                                        cdsCompNF.FieldByName('Tamanho').AsInteger);
                    PosicionaValor(TxtNF,iColuna,iLinha,sValor);
                 end;

                cdsCompNF.Next;
             end;
          end
         else
          begin
             //Linhas Detalhe

             //Obs: Todo os campos que formam a área de detalhe da nota  devem estar posicionados na
             //     primeira linha que foi definida como detalhe
             if not(cdsCompNF.Locate('Linha',cdsModelosNF.FieldByName('LINDETINICIAL').AsInteger,
                                           [])) or (cdsDadosNF.Eof) then Continue;

             while (cdsCompNF.FieldByName('Linha').AsInteger=
                    cdsModelosNF.FieldByName('LINDETINICIAL').AsInteger) and
                    not(cdsCompNF.Eof) and not(cdsDadosNF.Eof) do
             begin
                iColuna:=cdsCompNF.FieldByName('Coluna').AsInteger;
                sValor:='';

                case cdsCompNF.FieldByName('IDCompNF').AsInteger of
                   19: begin //Descrição dos itens da Nota
                          sValor:=cdsDadosNF.FieldByName('NOME_ITEM').AsString+' / '+
                                  cdsDadosNF.FieldByName('NOMEOBJETO').AsString;
                          if (chbExibeIdentImposto.Checked) and
                             (Abs(GeraTotalImposto(Sistema.IdEmpresa,
                                  cdsContratos.FieldByName('IDContrato').AsFloat,
                                  StrToFloat(dblcImposto.LookupValue),
                                  cdsDadosNF.FieldByName('IDPARCELA').AsFloat,
                                  cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime,rAliquota))<>0) then
                              sValor:=sValor+'(*)';
                       end;
                   20: sValor:='Unidade de Medida'; //Unidade de Medida
                   21: sValor:=FormatFloat('0000',cdsDadosNF.FieldByName('QTDEPARCELA').AsFloat); // Quantidade
                   22: sValor:=FormatFloat('#,##0.00',
                                           cdsDadosNF.FieldByName('VALOROBJPARCELA').AsFloat); //Valor do item
                   23: sValor:=FormatFloat('#,##0.00',
                                           cdsDadosNF.FieldByName('VLRMOEDACORRENTE').AsFloat); //Valor total do item
                end;

                if (Length(sValor)>cdsCompNF.FieldByName('TAMANHO').AsInteger) then
                   GeraMultiplasLinhas(sValor,iColuna,iLinha,
                                       cdsCompNF.FieldByName('TAMANHO').AsInteger,
                                       iNumMaxLinhas,TxtNF)

                else
                 begin
                    sValor:=AlinhaTexto(sValor,
                                        cdsCompNF.FieldByName('FLGALINHAMENTO').AsString,
                                        cdsCompNF.FieldByName('Tamanho').AsInteger);
                    PosicionaValor(TxtNF,iColuna,iLinha,sValor);
                 end;

                if not(cdsCompNF.Eof) then cdsCompNF.Next;
             end;
             if not(cdsDadosNF.Eof) then cdsDadosNF.Next;
          end;
      end; //Fim do for

     //ImprimePágina
     for iLinha:=0 to TxtNF.Count-1 do
         Gimp.ImprimirTexto(TxtNF.Strings[iLinha]);

   finally
      TxtNF.Free;
   end;
end;

function TfrmImpNFMT.ImprimeNFImpFiscal: Boolean;
var
   rValorImposto    : Double;
   sDescricaoItem   : String;
begin
   Result:=True;

   Hasar.AbrirComprovanteFiscal(TIPO_LC);

   cdsDadosNF.First;
   while not(cdsDadosNF.Eof) do
   begin
      rAliquota:=0;
      rValorImposto:=GeraTotalImposto(Sistema.IdEmpresa,
                                      cdsContratos.FieldByName('IDContrato').AsFloat,
                                      0,cdsDadosNF.FieldByName('IDPARCELA').AsFloat,
                                      cdsContratos.FieldByName('DATAVENCPARCELA').AsDateTime,
                                      rAliquota);

      //A linha abaixo é usada para testes com bases com dados em Português
      sDescricaoItem:=Trim(cdsDadosNF.FieldByName('NOME_ITEM').AsString)+' / '+
                      Trim(cdsDadosNF.FieldByName('NOMEOBJETO').AsString);

      Hasar.ImprimirItem(sDescricaoItem,
                         Trunc(cdsDadosNF.FieldByName('QTDEPARCELA').AsFloat),
                         cdsDadosNF.FieldByName('VALOROBJPARCELA').AsFloat,
                         rAliquota);
      cdsDadosNF.Next;
   end;

   Hasar.SubTotal(True);
   Hasar.FecharComprovanteFiscal;
end;

function TfrmImpNFMT.GeraTotalImposto(rIDPessoa, rIDContrato,
  rCodAlterador, rIDParcela: Double; dDataVencParc: TDateTime;
  var rAliquota: Double): Real;
var
   sSql : String;
begin
   Result:=0;

   sSql:='SELECT II.ALIQUOTA,NVL(SUM(DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)),0) AS IMPOSTO '+
         'FROM LANCTODOCUM L, IMPOSTORETIDO II '+
         'WHERE  ';

   if (rCodAlterador=0) then
      sSql:=sSql+'       (L.CODALTERADOR IN (SELECT CODALTERADOR '+
                 '                           FROM IMPOSTOIMPNF '+
                 '                           WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+'))) AND '
   else
      sSql:=sSql+'       (L.CODALTERADOR = '+FloatToStr(rCodAlterador)+') AND ';
      
   sSql:=sSql+'       (II.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
         '       (II.NUMLANCTO = L.NUMLANCTO) AND '+
         '       (EXISTS (SELECT P.CODDOCUMENTO '+
         '                FROM PARCELAREALCONTR P, '+
         '                     TIPOAGRE T, '+
         '                     DOCUMENTO D, '+
         '                     IMPOSTORETIDO I, '+
         '                     OBJETOXITEM OI, '+
         '                     TIPORECEBDESEMB TRD '+
         '                WHERE (P.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '                      (P.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND ';

   if (rIDParcela<>0) then
       sSql:=sSql+'                      (P.IDPARCELA = '+FloatToStr(rIDParcela)+') AND ';

   sSql:=sSql+'                      (D.CODDOCUMENTO = P.CODDOCUMENTO) AND '+
              '                      (I.CODDOCUMENTO = P.CODDOCUMENTO) AND '+
              '                      (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG) AND '+
              '                      (OI.IDOBJETO = P.IDOBJETO) AND '+
              '                      (OI.IDITEM = P.IDITEM) AND '+
              '                      (OI.CODTIPRECDES = TRD.CODTIPRECDES) AND '+
              '                      (OI.RECPAG = TRD.RECPAG) AND '+
              '                      (OI.IDPESSOA = TRD.IDPESSOA) AND '+
              '                      (TRD.FLGCALCULAIMPOSTO = ''S'') AND '+
              '                      (P.DATAVENCPARCELA = TO_DATE('''+
              FormatDateTime('dd/mm/yyyy',dDataVencParc)+''',''dd/mm/yyyy'')) AND '+
              '                      (P.CODDOCUMENTO = L.CODDOCUMENTO )) ) '+
              'GROUP BY II.ALIQUOTA';

   spAux.SQL.Text:=sSql;
   spAux.Open;

   Result:=cdsAux.FieldByName('IMPOSTO').AsFloat;
   rAliquota:=cdsAux.FieldByName('ALIQUOTA').AsFloat;

   cdsAux.Close;
end;

function TfrmImpNFMT.GeraTotalNota: Real;
begin
   Result:=0;
   cdsDadosNF.First;
   while not(cdsDadosNF.Eof) do
   begin
      Result:=Result+cdsDadosNF.FieldByName('VLRMOEDACORRENTE').AsFloat;
      cdsDadosNF.Next;
   end;
end;

procedure TfrmImpNFMT.GeraMultiplasLinhas(sTexto: String; iColuna, iLinha,
  iTamanho, iNumMaxLinhas: Integer; TextoNF: TStringList);
var
   sRestoTexto : String;
   iLinhaAux   : Integer;
begin
   iLinhaAux:=iLinha;
   sRestoTexto:='XXXX'; //qualquer coisa
   while (sRestoTexto<>'') do
   begin
      TruncaTexto(sTexto,sRestoTexto,cdsCompNF.FieldByName('TAMANHO').AsInteger);
      sTexto:=AlinhaTexto(sTexto,cdsCompNF.FieldByName('FLGALINHAMENTO').AsString,
                          cdsCompNF.FieldByName('Tamanho').AsInteger);
      if (iLinhaAux<>iLinha) then TextoNF.Add('');
      PosicionaValor(TextoNF,iColuna,iLinhaAux,sTexto);
      Inc(iLinhaAux);
      sTexto:=sRestoTexto;
   end;
end;

function TfrmImpNFMT.AlinhaTexto(sTexto, sAlinhamento: String;
  iTamanho: Integer): String;
var
   iNumCar : Integer;
begin
   Result:=Trim(sTexto);
   iNumCar:=Length(sTexto);
   if (iNumCar<iTamanho) then
    begin
       if (UpperCase(sAlinhamento)='C') then
           Result:=Replicate(' ',((iTamanho-iNumCar) div 2))+Trim(Result);
       if (UpperCase(sAlinhamento)='D') then
           Result:=Replicate(' ',(iTamanho-iNumCar))+Trim(Result);
    end;
end;

procedure TfrmImpNFMT.PosicionaValor(var Txt: TStringList; iColuna,
  iLinha: Integer; Valor: String);
begin
   Txt.Strings[iLinha-1]:=JuntaString((Replicate(' ',iColuna-1)+Valor),Txt.Strings[iLinha-1]);
end;

procedure TfrmImpNFMT.TruncaTexto(var sTexto, sRestoTexto: String;
  iTamanho: Integer);
var
   iCar : integer;
begin
   sTexto:=Trim(sTexto);
   sRestoTexto:='';
   if (Length(sTexto)<=iTamanho) then Exit;
   for iCar:=iTamanho downto 1 do
   begin
       if (sTexto[iCar]=#32) then
        begin
           sRestoTexto:=Copy(sTexto,(iCar+1),(Length(sTexto)-iCar));
           sTexto:=Copy(sTexto,1,iCar);
           Break;
        end;

       if (iCar=1) then
        begin
           sRestoTexto:=Copy(sTexto,(iTamanho+1),(Length(sTexto)-iTamanho));
           sTexto:=Copy(sTexto,1,iTamanho);
        end;
   end;
end;

function TfrmImpNFMT.Replicate(sPadrao: String;
  iNumVezes: Integer): String;
var
   iVezes : Integer;
begin
   Result:='';
   if (iNumVezes<1) or (sPadrao='') then Exit;
   for iVezes:=1 to iNumVezes do Result:=Result+sPadrao;
end;

function TfrmImpNFMT.JuntaString(sA, sB: String): String;
var
   INumCarA  : Integer;
   INumCarB  : Integer;
   iCar      : Integer;
   iTotalCar : Integer;
   cCar      : Char;
   cCarA     : Char;
   cCarB     : Char;
begin
   Result:='';
   INumCarA:=Length(sA);
   INumCarB:=Length(sB);

   iTotalCar:=INumCarA;
   if (INumCarB>INumCarA) then iTotalCar:=INumCarB;

   for iCar:=1 to iTotalCar do
   begin
      cCar:=#32;
      cCarA:=#32;
      if iCar<=INumCarA then cCarA:=sA[iCar];
      cCarB:=#32;
      if iCar<=INumCarB then cCarA:=sB[iCar];


      if (cCarA<>cCarB) and (cCarA>#32) and (cCarB>#32) then
         cCar:=Char('#')
      else
         if (cCarA>#32) then
            cCar:=cCarA
         else
            cCar:=cCarB;

      Result:=Result+cCar;
   end;
end;

function TfrmImpNFMT.SubstCarEspeciais(sTexto: String): String;
begin
   {Esta procedure foi implementada para retirar alguns caracteres especiais dos dados em
    uso. Caso muito comum quando se usando dados de clientes de outros países}

   Result:=StringReplace(sTexto,'Á','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'À','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ã','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ä','A',[rfReplaceAll]);
   Result:=StringReplace(Result,'Â','A',[rfReplaceAll]);

   Result:=StringReplace(Result,'á','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'à','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'ã','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'ä','a',[rfReplaceAll]);
   Result:=StringReplace(Result,'â','a',[rfReplaceAll]);

   Result:=StringReplace(Result,'É','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'È','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ë','E',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ê','E',[rfReplaceAll]);

   Result:=StringReplace(Result,'é','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'è','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'ë','e',[rfReplaceAll]);
   Result:=StringReplace(Result,'ê','e',[rfReplaceAll]);

   Result:=StringReplace(Result,'Í','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ì','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ï','I',[rfReplaceAll]);
   Result:=StringReplace(Result,'Î','I',[rfReplaceAll]);

   Result:=StringReplace(Result,'í','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'ì','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'ï','i',[rfReplaceAll]);
   Result:=StringReplace(Result,'î','i',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ó','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ò','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Õ','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ö','O',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ô','O',[rfReplaceAll]);

   Result:=StringReplace(Result,'ó','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ò','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'õ','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ö','o',[rfReplaceAll]);
   Result:=StringReplace(Result,'ô','o',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ú','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ù','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Ü','U',[rfReplaceAll]);
   Result:=StringReplace(Result,'Û','U',[rfReplaceAll]);

   Result:=StringReplace(Result,'ú','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'ù','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'ü','u',[rfReplaceAll]);
   Result:=StringReplace(Result,'û','u',[rfReplaceAll]);

   Result:=StringReplace(Result,'Ç','C',[rfReplaceAll]);
   Result:=StringReplace(Result,'ç','c',[rfReplaceAll]);
end;

procedure TfrmImpNFMT.grdContratosTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if (AFieldName='NOMECONTRATO') then cdsContratos.IndexName:='indContrato';
   if (AFieldName='NODOCUMENTO') then cdsContratos.IndexName:='indDocumento';
   if (AFieldName='DATAVENCPARCELA') then cdsContratos.IndexName:='indDataVencParc';
end;

end.
