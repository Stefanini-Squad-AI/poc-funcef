// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)   :  Jéssica Lana Nunes dos Santos
// Data       :  05/03/2009
// Pendência  :  SOL 109421 KINTANA 496332
// Descricao  :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Rotina     : bbtnConfirmarClick
// SOL        : 92822
// Kintana    : 389089
// Data       : 27/08/2008
// Responsável: André Luiz
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Data      : 05/10/2007
// Código    : AL_2
// Pendencia : 26219
// Motivo    : Atualizacao do Paraminvest com a data da ultima importação
//             Testar todos os campos na Alteraçao
//******************************************************************************
// Data      : 03/09/2007
// Código    : AL_1
// Pendencia : 26219
// Motivo    : Implementações da Importação Arquivos Bovespa
//******************************************************************************
unit FImportCotacoesBovespa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTInv, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel,
  ExtCtrls, Wwdbspin, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlRendaVariavel, uCtrlPadroes,  uMensErro, dBaseDados, uCtrlParamInvest,
  URendaVariavel, uOperComum, USistema,
  //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
  uCtrlParamCotacaoRV;

type
  TFrmImportCotacoesBovespa = class(TFrmCadastroMTInv)
    OpenDialog1: TOpenDialog;
    lblCaminhoArquivo: TLabel;
    dbeCaminhoArquivo: TwwDBEdit;
    lblDtaSaldo: TLabel;
    lblTabela: TLabel;
    lblBolsaValores: TLabel;
    lblDataPregao: TLabel;
    SB1: TSpeedButton;
    CdsAcoesXBolsa: TCMClientDataSet;
    CdsCotacaoAcao: TCMClientDataSet;
    CdsParaminvest: TCMClientDataSet;
    procedure SB1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaTextos;
    procedure DesabilitaTextos;

  public
    { Public declarations }
    CtrlRendaVariavel : TCtrlRendaVariavel;
    //AL_2
    CtrlParamInvest : TCtrlParamInvest;
  end;

var
  FrmImportCotacoesBovespa: TFrmImportCotacoesBovespa;
  sArquivo : TextFile;
  sLinha, sTipoReg, sCodOrigem, sDataPregao : String;


implementation

{$R *.DFM}

procedure TFrmImportCotacoesBovespa.HabilitaTextos;
begin
   lblDataPregao.Visible := True;
   lblBolsaValores.Visible := True;

   lblDataPregao.Caption := sDataPregao;
   lblBolsaValores.Caption := sCodOrigem;
end;

procedure TFrmImportCotacoesBovespa.DesabilitaTextos;
begin
   lblDataPregao.Visible := False;
   lblBolsaValores.Visible := False;
   lblDataPregao.Caption := '';
   lblBolsaValores.Caption := '';
end;

procedure TFrmImportCotacoesBovespa.SB1Click(Sender: TObject);
begin
  inherited;
   DesabilitaTextos;

   try
      if (OpenDialog1.Execute) then
      begin

         dbeCaminhoArquivo.Text := UpperCase(OpenDialog1.FileName);

         if not (FileExists(dbeCaminhoArquivo.Text)) Then Begin
            MsgDlg('Arquivo não Existe ou Inválido ...','Mensagem do Sistema',MtWarning,[MbOk],0);
            if dbeCaminhoArquivo.CanFocus then
               dbeCaminhoArquivo.SetFocus;
            Exit;
         End
         else
         begin
            dbeCaminhoArquivo.Text := UpperCase(OpenDialog1.FileName);

            AssignFile(sArquivo, dbeCaminhoArquivo.Text);
            // Abre Arquivo para Leitura
            Reset(sArquivo);
            // Testa se Arquivo esta Vazio
            if Eof(sArquivo) then
            begin
               MsgDlg('Arquivo está vazio...','Mensagem do Sistema',MtWarning,[MbOk],0);
               if dbeCaminhoArquivo.CanFocus then
                  dbeCaminhoArquivo.SetFocus;
               Exit;
            end;

            while not Eof(sArquivo) do
            begin
               // Lê a Linha
               Readln(sArquivo,sLinha);
               // Lay-out
               //Tipo Registro
               sTipoReg := Copy(sLinha,1,2);
               if sTipoReg = '00' then //  Header
               begin
                  sCodOrigem   := Copy(sLinha,11,8);
                  sDataPregao  := Copy(sLinha,31,4);
                  sDataPregao  := Copy(sLinha,35,2) + '/' + sDataPregao;
                  sDataPregao  := Copy(sLinha,37,2) + '/' + sDataPregao;
                  HabilitaTextos;
                  Exit;
               end;
            end;
            CloseFile(sArquivo);
         end;
      end;
   finally

   end;
end;

procedure TFrmImportCotacoesBovespa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlRendaVariavel);
   //AL_2
   FreeAndNil(CtrlParamInvest);
end;

procedure TFrmImportCotacoesBovespa.FormCreate(Sender: TObject);
begin
  inherited;
   OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);

   //AL_2
   CtrlParamInvest := TCtrlParamInvest.Create;
   CtrlParamInvest.InitializeAs(Padroes);

   Cds.Data  := CtrlRendaVariavel.ListCotacaoAcao(0);

   //AL_2
   CtrlParamInvest.CdsParamInvest := CdsParaminvest;
   CdsParaminvest.Data  := CtrlParamInvest.ListParamInvest;

   CtrlRendaVariavel.CdsCotacaoAcao := CdsCotacaoAcao;
   CdsCotacaoAcao.Data := CtrlRendaVariavel.ListCotacaoAcao(0);
end;

procedure TFrmImportCotacoesBovespa.bbtnConfirmarClick(Sender: TObject);
var
   sCodBDI : string;
   //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
   sVlrAbertura, sVlrFechamento, sVlrMaxima, sVlrMinima, sVlrMedia, sVolNegociado, sQtdLote,sCampo , sTipoCotacao,sComparaRegCotacao : string;
   fVlrAbertura, fVlrFechamento, fVlrMaxima, fVlrMinima, fVlrMedia, fVolNegociado, fQtdLote : Double;
   //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
   CtrlParamCotacaoRV : TCtrlParamCotacaoRV;
begin
  inherited;
   Try
      Try
         AssignFile(sArquivo, dbeCaminhoArquivo.Text);
         // Abre Arquivo para Leitura
         Reset(sArquivo);

         while not Eof(sArquivo) do
         begin
            // Lê a Linha
            Readln(sArquivo,sLinha);
            // Lay-out
            //Tipo Registro
            sTipoReg := Copy(sLinha,1,2);
            if sTipoReg = '02' then //  Resumo Diário de Negociações por Papel - Mercado
            begin
               sCodBDI        := Trim(Copy(sLinha,58,12));
               sVlrAbertura   := Copy(sLinha,91,9)   + DecimalSeparator + Copy(sLinha,100,2);
               sVlrMaxima     := Copy(sLinha,102,9)  + DecimalSeparator + Copy(sLinha,111,2);
               sVlrMinima     := Copy(sLinha,113,9)  + DecimalSeparator + Copy(sLinha,122,2);
               sVlrMedia      := Copy(sLinha,124,9)  + DecimalSeparator + Copy(sLinha,133,2);
               sVlrFechamento := Copy(sLinha,135,9)  + DecimalSeparator + Copy(sLinha,144,2);
               sVolNegociado  := Copy(sLinha,194,15) + DecimalSeparator + Copy(sLinha,209,2);
               sQtdLote       := Copy(sLinha,246,7);

                //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
                CtrlParamCotacaoRV := TCtrlParamCotacaoRV.Create;
                CtrlParamCotacaoRV.InitializeAs(Padroes);
                
                sCampo := CtrlParamCotacaoRV.RetornaCotacaoVigente(NOW,sTipoCotacao);

                if sTipoCotacao = 'A' then
                  sComparaRegCotacao :=  sVlrAbertura
                else
                if sTipoCotacao = 'F' then
                  sComparaRegCotacao :=  sVlrFechamento
                else
                if sTipoCotacao = 'X' then
                  sComparaRegCotacao :=  sVlrMaxima
                else
                if sTipoCotacao = 'M' then
                  sComparaRegCotacao :=  sVlrMinima;

               //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
               if OperComum.ComparaValores(StrToFloat(FormatFloat('###############0.00',StrToFloat(sComparaRegCotacao))), 0, '<>', 2) then
               begin
                  // Procura se está cadastrado na ACOESXBOLSA pela SIGLAACAOBOLSA da BOVESPA
                  CdsAcoesXBolsa.Data := CtrlRendaVariavel.ListAcoesXBolsa(-1, -1, CtrlPInv.IdBVSP, sCodBDI);
                  if not CdsAcoesXBolsa.IsEmpty then
                  begin
                     // Verificar se a cotação já está cadastrada
                     CdsCotacaoAcao.Close;
                     CdsCotacaoAcao.Data := CtrlRendaVariavel.ListCotacaoAcao(CdsAcoesXBolsa.FieldByName('IDACAO').AsInteger,
                                                                              CdsAcoesXBolsa.FieldByName('IDEMISSOR').AsInteger,
                                                                              CtrlPInv.IdBVSP,
                                                                              StrToDate(sDataPregao));

                     // Se existir e for diferente faço Update
                     if not CdsCotacaoAcao.IsEmpty then
                     begin
                        //AL_2
                        if (OperComum.ComparaValores(StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMedia))),
                                                    CdsCotacaoAcao.FieldByName('VLRMEDIA').AsFloat,
                                                    '<>', 2)) or
                           (OperComum.ComparaValores(StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrAbertura))),
                                                    CdsCotacaoAcao.FieldByName('VLRABERTURA').AsFloat,
                                                    '<>', 2)) or
                           (OperComum.ComparaValores(StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrFechamento))),
                                                    CdsCotacaoAcao.FieldByName('VLRFECHAMENTO').AsFloat,
                                                    '<>', 2)) or
                           (OperComum.ComparaValores(StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMaxima))),
                                                    CdsCotacaoAcao.FieldByName('VLRMAXIMA').AsFloat,
                                                    '<>', 2)) or
                           (OperComum.ComparaValores(StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMinima))),
                                                    CdsCotacaoAcao.FieldByName('VLRMINIMA').AsFloat,
                                                    '<>', 2)) or
                           (OperComum.ComparaValores(StrToFloat(FormatFloat('###############0.00',StrToFloat(sVolNegociado))),
                                                    CdsCotacaoAcao.FieldByName('VOLNEGOCIADO').AsFloat,
                                                    '<>', 2)) then
                        begin
                           CdsCotacaoAcao.Edit;
                           CdsCotacaoAcao.FieldByName('VLRABERTURA').AsFloat      := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrAbertura)));
                           CdsCotacaoAcao.FieldByName('VLRFECHAMENTO').AsFloat    := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrFechamento)));
                           CdsCotacaoAcao.FieldByName('VLRMAXIMA').AsFloat        := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMaxima)));
                           CdsCotacaoAcao.FieldByName('VLRMINIMA').AsFloat        := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMinima)));
                           CdsCotacaoAcao.FieldByName('VLRMEDIA').AsFloat         := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMedia)));
                           CdsCotacaoAcao.FieldByName('VOLNEGOCIADO').AsFloat     := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVolNegociado)));
                           CdsCotacaoAcao.FieldByName('QTDELOTE').AsFloat         := StrToFloat(FormatFloat('###############0',StrToFloat(sQtdLote)));
                           CdsCotacaoAcao.Post;

                           if not CtrlRendaVariavel.AplicaAtualCotacaoAcao then
                              Raise Exception.Create('');

                           // Se data anterior, marcar reproc
                           if StrToDate(sDataPregao) <= CtrlPInv.DataUltFech then
                           begin
                              if not RendaVariavel.MarcarFlagReproc(CdsAcoesXBolsa.FieldByName('IDACAO').AsInteger, -1,-1,
                                                                    StrToDate(sDataPregao)) then
                                 Raise Exception.Create('Não foi possível marcar a ação '+ sCodBDI +' para Reprocessamento.');
                           end;

                        end;
                     end
                     else
                     begin
                        // Se não exite
                        CdsCotacaoAcao.Insert;
                        CdsCotacaoAcao.FieldByName('IDACAO').AsInteger         := CdsAcoesXBolsa.FieldByName('IDACAO').AsInteger;
                        CdsCotacaoAcao.FieldByName('IDEMISSOR').AsInteger      := CdsAcoesXBolsa.FieldByName('IDEMISSOR').AsInteger;
                        CdsCotacaoAcao.FieldByName('IDBOLSAVALORES').AsInteger := CdsAcoesXBolsa.FieldByName('IDBOLSAVALORES').AsInteger;
                        CdsCotacaoAcao.FieldByName('DATACOTAACAO').AsDateTime  := StrToDate(sDataPregao);
                        CdsCotacaoAcao.FieldByName('VLRABERTURA').AsFloat      := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrAbertura)));
                        CdsCotacaoAcao.FieldByName('VLRFECHAMENTO').AsFloat    := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrFechamento)));
                        CdsCotacaoAcao.FieldByName('VLRMAXIMA').AsFloat        := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMaxima)));
                        CdsCotacaoAcao.FieldByName('VLRMINIMA').AsFloat        := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMinima)));
                        CdsCotacaoAcao.FieldByName('VLRMEDIA').AsFloat         := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVlrMedia)));
                        CdsCotacaoAcao.FieldByName('VOLNEGOCIADO').AsFloat     := StrToFloat(FormatFloat('###############0.00',StrToFloat(sVolNegociado)));
                        CdsCotacaoAcao.FieldByName('QTDELOTE').AsFloat         := StrToFloat(FormatFloat('###############0',StrToFloat(sQtdLote)));
                        CdsCotacaoAcao.Post;

                        if not CtrlRendaVariavel.AplicaAtualCotacaoAcao then
                           Raise Exception.Create('');

                        // Se data anterior, marcar reproc
                        if StrToDate(sDataPregao) <= CtrlPInv.DataUltFech then
                        begin
                           if not RendaVariavel.MarcarFlagReproc(CdsAcoesXBolsa.FieldByName('IDACAO').AsInteger, -1,-1,
                                                                 StrToDate(sDataPregao)) then
                              Raise Exception.Create('Não foi possível marcar a ação '+ sCodBDI +' para Reprocessamento.');
                        end;
                     end;
                  end;
               end;
            end;
         end;
         // AL_2 - Atualiza ParamInvest
         if StrToDate(sDataPregao) >= CtrlPInv.Dataultimpcot then
         begin
            CdsParaminvest.Edit;
            CdsParaminvest.FieldByName('DATAULTIMPCOT').AsDateTime := StrToDate(sDataPregao);
            CdsParaminvest.Post;
            if not CtrlParamInvest.AplicaAtualParamInvest then
               Raise Exception.Create('Não foi possível atualizar o Parâmetro do Sistema.');
         end;
         MsgDlg('Importação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
      except
         on E:Exception do
         begin
            CloseFile(sArquivo);
            MsgDlg(E.Message, 'Mensagem do Sistema', MtWarning,[MbOk],0);
         end;
      end;
   finally
      FreeAndNil(CtrlParamCotacaoRV);
      DesabilitaTextos;
      bbtnCancelarClick(self);
   end;
end;

procedure TFrmImportCotacoesBovespa.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   DesabilitaTextos;
end;

end.


