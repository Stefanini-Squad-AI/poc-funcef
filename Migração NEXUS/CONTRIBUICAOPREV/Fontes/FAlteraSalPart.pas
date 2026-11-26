// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Alteração  : btnModeloClick
//Nº WO......: 9432
//Data.......: 22/03/2024
//Responsável: Andre Imakawa
//Descrição..: Alteração do \\FUNCEF.COM.BR\ARQUIVOS pasta Compartilhada
//------------------------------------------------------------------------------
//Alteração  : btnModeloClick
//Nº WO......: 8381
//Data.......: 28/02/2024
//Responsável: Andre Imakawa
//Descrição..: Alteração do ALTARF para \\FUNCEF.COM.BR\ARQUIVOS
//------------------------------------------------------------------------------
// Autor(a)    : Rafael Vasconcelos
// Pendencia   : SIG 99874
// Alteração   : Alterar o salário de Participação e Contribuição na PartPrevPlan
// -----------------------------------------------------------------------------
unit FAlteraSalPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, uMensErro,
  dBaseDados, UDataBase, SdfData, Spin, ADODB, ComObj;

type
  TFrmAlteraSalPart = class(TfrmOkCancelar)
    lbl1: TLabel;
    edtArquivo: TEdit;
    btnAbreArquivo: TBitBtn;
    btnLimpaArquivo: TBitBtn;
    btnModelo: TSpeedButton;
    mmoArquivo: TMemo;
    chkSalMant: TCheckBox;
    chkSalPart: TCheckBox;
    wqryqry: TwwQuery;
    ds: TwwDataSource;
    wqryUpdate: TwwQuery;
    wqryDel: TwwQuery;
    OpenDialog: TOpenDialog;
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure btnModeloClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteraSalPart: TFrmAlteraSalPart;

implementation
 uses FPrincipal, UAdmPrev;
{$R *.DFM}

procedure TFrmAlteraSalPart.btnAbreArquivoClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
     edtArquivo.Text := OpenDialog.FileName;
end;

procedure TFrmAlteraSalPart.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  mmoArquivo.Clear;
end;

procedure TFrmAlteraSalPart.btnModeloClick(Sender: TObject);
var excel :variant;
begin
  inherited;
      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := True;
      //Excel.WorkBooks.Add('\\altarf\#altarf\GETIF_PUBLICO\COARI\Modelos\Alteracao Salario de Contribuicao e Manutencao.xlsx');                // Andre Imakawa - WO8381
      //Excel.WorkBooks.Add('\\Funcef.com.br\arquivos\Planus\Documentos\COARI\Modelos\Alteracao Salario de Contribuicao e Manutencao.xlsx');   // Andre Imakawa - WO8381
      Excel.WorkBooks.Add('\\Funcef.com.br\arquivos\PLANUS_COARI\Modelos\Alteracao Salario de Contribuicao e Manutencao.xlsx');   // Andre Imakawa - WO9432

end;

procedure TFrmAlteraSalPart.bbtnConfirmarClick(Sender: TObject);
var
excel :variant;
ilinha,icoluna, iContCampos : integer;
bSair : boolean;

sIdpessoa, sIdpessjur, sIdplanoPrev, sSalMantido, sSalParticipacao ,sSqlAux, sQueryValida : String;

begin
  inherited;
if (edtArquivo.Text = '') then
  begin
       MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Contribuição-Prev', mtWarning, [mbOK], 0);
       Exit;
  end;

if not chkSalMant.Checked and not chkSalPart.Checked then
   begin
       MsgDlg('É necessário selecionar o salário que deseja alterar.', 'Contribuição-Prev', mtWarning, [mbOK], 0);
       Exit;
  end;

   mmoArquivo.Lines.Add('Carregando os dados...');

   try

      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := False;
      Excel.WorkBooks.Add(OpenDialog.FileName);

      mmoArquivo.Lines.Add('Lendo e processando os dados do arquivo informado...');

      StartTransacao;
      iLinha := 2;
      bSair := True;

        

      while bSair do
            begin
                    if Excel.Cells.Item[ilinha,1].Text <> '' then
                    begin
                          //Trantando os valores vindos do excel...
                          sIdpessjur   := Excel.Cells.Item[ilinha,1].Value;
                          sIdpessoa    := Excel.Cells.Item[ilinha,2].Value;
                          sIdplanoPrev         := Excel.Cells.Item[ilinha,3].Value;
                          sSalMantido :=     StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,4].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sSalParticipacao :=     StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,5].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);


                          iContCampos:= 0;

                          if sIdpessjur    = ''  then  sIdpessjur   := 'NULL';
                          if sIdpessoa     = ''  then  sIdpessoa    := 'NULL' else inc(iContCampos);    
                          if sIdplanoPrev          = ''  then  sIdplanoPrev         := 'NULL'    else inc(iContCampos);
                          if sSalMantido          = ''  then  sSalMantido         := 'NULL'    else inc(iContCampos);
                          if sSalParticipacao     = ''  then  sSalParticipacao    := 'NULL'    else inc(iContCampos);
                          

                          if (sIdpessoa <> 'NULL') and (sIdpessjur <> 'NULL') and (sIdplanoPrev <> 'NULL') then
                          begin
                              sSqlAux := '';
                              wqryUpdate.Close;

                              sSqlAux := ' UPDATE CM.PARTPREVPLAN SET ';

                              IF chkSalMant.Checked and chkSalPart.Checked then
                                sQueryValida := 'SALMANTIDO = ' +  sSalMantido + ' , SALPARTICIPACAO = '+ sSalParticipacao;
                              IF chkSalMant.Checked and not chkSalPart.Checked then
                                sQueryValida := 'SALMANTIDO = ' +  sSalMantido;
                              IF not chkSalMant.Checked and  chkSalPart.Checked then
                                sQueryValida := 'SALPARTICIPACAO = ' +  sSalParticipacao;

                              sSqlAux := sSqlAux + sQueryValida;
                              sSqlAux := sSqlAux + ' WHERE IDPESSOA=' +  sIdpessoa + ' and IDPESSJUR= ' +sIdpessjur+ 'and IDPLANOPREV=' + sIdplanoPrev;

                              wqryUpdate.SQL.Text:= sSqlAux;

                              try
                              wqryUpdate.ExecSql;
                              mmoArquivo.Lines.Add('--> Alteração do Salário do Idpessoa: ' + sIdpessoa + ' efetuado com sucesso!');
                              Except
                                 on E: Exception do                                             
                                   begin
                                   mmoArquivo.Lines.Add('--> Erro ao alterar o salário do Idpessoa ' + sIdpessoa + ' Erro: '+ E.Message );
                                   end;
                              end;

                          end;
                          iLinha := iLinha + 1;
                    end
                    else
                        bSair := False;
            end;


      dtmBaseDados.dbBaseDados.Commit;
      mmoArquivo.Lines.Add('Processo finalizado! ' + 'Total de linhas Processadas: ' + IntToStr(iLinha-2));
      GravaLogTotalPrev('Alteração do Salário de Manutenção e Participação em lote') ;
      Excel.Quit;
      Excel := Unassigned;


    Except
       dtmBaseDados.dbBaseDados.Rollback;
       Excel.Quit;
       Excel := Unassigned;
       btnLimpaArquivo.Click;
    end;
end;

procedure TFrmAlteraSalPart.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  mmoArquivo.Clear;
end;

end.
