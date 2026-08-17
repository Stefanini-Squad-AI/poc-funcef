{-----------------------------------------------------------------------------------
------------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ------------------------------
-------------------------------------------------------------------------------------
N.WO............: WO40263
Data............: 22/06/2026
Responsável.....: Paulo Nobre
Descrição.......: .Ajustes na mensagem de aviso sobre o saldo negativo.

-------------------------------------------------------------------------------------
N.WO............: WO38948
Data............: 21/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para corrigir erro na rotina de localização do saldo:
                  _BuscaUltimoSaldoContratoOuAditamento.
-------------------------------------------------------------------------------------
N.WO............: WO38245
Data............: 15/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para evitar que na alteração de um aditamento seja
                  emitida a msg de contagem das parcelas...
-------------------------------------------------------------------------------------
N.WO............: WO37036
Data............: 06/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes:
                  .Criando a variável publica "sNaoSeAplica" a ser usada no
                   FCadContratoMT para receber o valor do campo
                   FLG_TP_VLR_ORCADO_APROVADO;
                  .Criada uma label de identificação que identifica quando um 
                   Contrato tem a condição de "Não se Aplica";
-------------------------------------------------------------------------------------
N.WO............: WO28914
Data............: 11/03/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para melhorar os processos de inclsuão de um aditamento.
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 02/02/2026
Responsável.....: Paulo Nobre
Descrição.......: .Ajustado a regra para tornar o contrato e os aditamento anteriores
                   indisponíveis somente quando do reinicio das parcelas. Desta forma
                   o aditamento lançado com reinicio das parcelas passa a ser o que
                   será medido.
                  .Incluso novo tipo: "Regularização Legado" para os casos de acerto
                   dos contratos antigos.
-------------------------------------------------------------------------------------
N.WO............: WO22956
Data............: 27/06/2025
Responsável.....: Paulo Nobre
Descrição.......: Ajustado a regra para tornar o contrato ou aditamento anterior
                  indisponíveis somente quando do reinicio das parcelas. Desta forma
                  o aditamento lançado com reinicio das parcelas passa a ser o que
                  será medido.
------------------------------------------------------------------------------------
N.WO............: WO22494
Data............: 02/06/2025
Responsável.....: Paulo Nobre
Descrição.......: Alteração na rotina que ajusta aditamentos não conformes:
                  . No resultado da _BuscaUltimoSaldoContratoOuAditamento,
                    trocando o campo VALORBASECONTRATO para o SALDO A PAGAR.
                  . Atribuindo defaults aos campos: IDDOCCEDEUSALDO e
                    FLGREINICIODASPARCELAS.
------------------------------------------------------------------------------------
N.WO............: WO20776
Data............: 25/04/2025
Responsável.....: Paulo Nobre
Descrição.......: .Movendo a regras do evento FormPaint para o FormShow
                  .Ajustando a regras dentro do evento FormShow
                  .Aplicando pequenos ajustes em diversos eventos pontuais.
------------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 05/12/2024
Responsável.....: Paulo Nobre
Descrição.......: Implementado:
                  .Recurso de importar o saldo do contrato ou do ultimo aditamento
                   com valor para atualizar o campo valor. Neste caso, o
                   contrato/aditamento será marcado como tendo seu saldo transferido
                   (FLGSALDOTRANSFERIDO), não podendo mais ser medido.
                  .Se o aditamento for criado, sem o reinicio das parcelas, então
                   este não poderá ser medido até que tenha suas parcelas criadas.
                  .Qualquer aditamento criado com valor e com parcelas reiniciadas
                   assumirá o papel do contrato, ou seja, as medições ocorreram
                   neste aditamento.
                  .Para aditamentos sem valor e sem parcelas, será forçado o tipo
                   ser = "Outros".
-----------------------------------------------------------------------------------
N. SIG..........: 121740
Data............: 16/12/2021
Responsável.....: Everson Cunha
Descrição.......: Aumentar o tamanho do campo "Descrição do Aditamento"
--------------------------------------------------------------------------------
Nº SIG......: 111798
Data........: 23/03/2021
Responsável.: Everson Cunha
Descrição...: Criado o campo "Valor Aditamento"
--------------------------------------------------------------------------------
N. SIG..........: 94164
Data............: 21/11/2019
Responsável.....: Fábio Sampaio
Descrição.......: Tratamento para quando o IDADITAMENTO estiver em branco
--------------------------------------------------------------------------------
N. SIG..........: 81261
Data............: 14/10/2019
Responsável.....: Fábio Sampaio
Descrição.......: Correção para que no reinício da contagem seja apagado os
                  registros associados ao aditamento que está sendo alterado,
                  desde que estes não tenham sidos registrados, ou seja,
                  com os campos FLGPARCELAMEDIDA = 0 e IDMEDICAO = NULL.
--------------------------------------------------------------------------------
N. Sol..........: 41489
Data............: 14/03/2017
Responsável.....: Fernando Xavier/ William Moreira da Silva
Descrição.......: Não está considerando a alteração do tipo "aditamento" para "outros"
--------------------------------------------------------------------------------
N. Sol..........: 217597/17169
N. PPM..........: 772732
Data............: 12/05/2015
Responsável.....: Felipe A. Santos
Descrição.......: preenchimento automático do campo código, quando o tipo for
                  aditamento.
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724 
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação do tipo do aditamento e da flag de reinício das parcelas
                  que incide da gravação nas tabelas ADITAMENTO e
                  CTRLPARCELAMEDICAO.
--------------------------------------------------------------------------------}

unit FCadAditamentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Mask, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBClient, uCMClientDataSet,
  // Felipe A. Santos SOL 218909/16724 PPM 588170 {fim uCtrlCtrlParcelaMedicao }
  uCtrlCtrlParcelaMedicao,
  // Felipe A. Santos SOL 217597/17169 PPM 772732 {fim uCtrlAditamento  }
  uCtrlAditamento, TREdit
  ,uCtrlContratos, DBTables, Wwquery;    // Paulo Nobre -  WO15750
  
type
  TfrmCadAditamentoMT = class(TfrmOkCancelar)
    pnlTopo: TPanel;
    dbmemDescricao: TDBMemo;
    Label1: TLabel;
    dbtpDataAssinatura: TCMDateTimePicker;
    Label3: TLabel;
    dbeCodAditamento: TDBEdit;
    cdsAditamento: TCMClientDataSet;
    dsAditamento: TDataSource;
    cdsCtrlParcelaMedicao: TCMClientDataSet; // Felipe A. Santos SOL 218909/16724 PPM 588170
    cdsServProdXItemContr: TCMClientDataSet;
    Label2: TLabel;
    rbAditamento: TRadioButton;
    rbOutros: TRadioButton;
    lblTipo: TLabel;
    cdsSaldoContrato: TCMClientDataSet;
    qryAux: TwwQuery;
    lblValorAditamento: TLabel;
    edtValorAditado: TDBRealEdit;
    chkbImportaSaldo: TCheckBox;
    qryAux2: TwwQuery;
    chkReqReinicioParc: TDBCheckBox;
    Label4: TLabel;
    rbRegula: TRadioButton;
    stCondicao: TStaticText;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    // Felipe A. Santos SOL 217597/17169 PPM 772732 {fim FormClose}
    procedure rbAditamentoClick(Sender: TObject);
    procedure rbOutrosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkbImportaSaldoClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure rbRegulaClick(Sender: TObject);
  private
    { Private declarations }

    FCtrlAditamento : TCtrlAditamento; // Felipe A. Santos SOL 217597/17169 PPM 772732

    // Felipe A. Santos SOL 218909/16724 PPM 588170
    FCtrlCtrlParcelaMedicao : TCtrlCtrlParcelaMedicao;
    // Felipe A. Santos SOL 218909/16724 PPM 588170

    FCtrlContratos   : TCtrlContratos;  // Paulo Nobre -  WO15750

  public
    { Public declarations }
    rIdContrato : Double;
    rIdCorrecao : Double;
    dData       : TDateTime;
    sTexto      : String;
    bAlterando  : Boolean; // Alterado por FHBS - 17/10/2019 - SIG81261

    sChamador   : String;  // Paulo Nobre -  WO15750

    sNaoSeAplica : String; // Paulo Nobre - WO37036
    
    bAditamentoComParcelasSemValorBase : Boolean;  // Paulo Nobre - WO20776

  end;

var
  frmCadAditamentoMT: TfrmCadAditamentoMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro,
     {Felipe A. Santos SOL 217597/17169 PPM 772732 - uCtrlPadroes }
     uCtrlPadroes;

procedure TfrmCadAditamentoMT.FormCreate(Sender: TObject);
begin
  inherited;
  rIdContrato := 0;
  rIdCorrecao := 0;
  dData       := 0;
  sTexto      := '';
  bAlterando  := False; // Alterado por FHBS - 17/10/2019 - SIG81261

 // sChamador := 'cadAdit';    // Paulo Nobre -  WO15750

  // Paulo Nobre -  WO38948 - Inicio

  // Paulo Nobre -  WO15750 - Inicio
  FCtrlContratos := TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
  FCtrlContratos.Initialize(dtmBaseDados.dbBaseDados, True);
  // Paulo Nobre -  WO15750 - Fim

  // Paulo Nobre -  WO38948 - Fim  

end;

procedure TfrmCadAditamentoMT.FormShow(Sender: TObject);
begin
  inherited;

    // Felipe A. Santos SOL 217597/17169 PPM 772732 - início
  FCtrlAditamento := TCtrlAditamento.Create;
  FCtrlAditamento.InitializeAs(Padroes);

  if (cdsAditamento.Active) then
  begin
    if rIdCorrecao = 0 then begin
       cdsAditamento.Insert;
    end
    else
    begin
       if cdsAditamento.Locate('ID_TEMP',rIdCorrecao,[]) then
         cdsAditamento.Edit
       else
         cdsAditamento.Insert;
    end;

    cdsAditamento.FieldByName('IDCONTRATO').AsFloat := rIdContrato;
    cdsAditamento.FieldByName('ID_TEMP').AsFloat    := rIdCorrecao;
    //Fernando Xavier - SIG 41489
    //cdsAditamento.FieldByName('FLGTIPO').AsString   := 'A'
    if cdsAditamento.State = dsInsert then
    begin
      cdsAditamento.FieldByName('FLGTIPO').AsString   := 'A';  // Default = Aditamento
      if dData > 0    then cdsAditamento.FieldByName('DATAASSADITAMENTO').AsDateTime := dData;
      if sTexto <> '' then cdsAditamento.FieldByName('DESCADITAMENTO').AsString      := sTexto;

      // Paulo Nobre -  WO15750 - Inicio
      chkbImportaSaldo.Checked := False;
      chkReqReinicioParc.Checked := False;
      cdsAditamento.FieldByName('FLGSALDOTRANSFERIDO').AsString := 'S';    // Paulo Nobre - WO38245
      cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').AsString := 'N';
      // Paulo Nobre -  WO15750 - Fim
    end
    else
    begin
      rbAditamento.Checked := (cdsAditamento.FieldByName('FLGTIPO').AsString  = 'A');      // Aditamento
      rbOutros.Checked     := (cdsAditamento.FieldByName('FLGTIPO').AsString  = 'C');      // Outros
      rbRegula.Checked     := (cdsAditamento.FieldByName('FLGTIPO').AsString  = 'R');      // Regularização   // Paulo Nobre - WO31928
      bAditamentoComParcelasSemValorBase := False;

      // Paulo Nobre -  WO20776 - Inicio
      // Aditamento tem parcelamento
      If FCtrlAditamento._VerificaSeAditamentoTemParcelamento(Trunc(rIdContrato), cdsAditamento.FieldByName('IDADITAMENTO').AsInteger ) Then
      Begin
          // Não conformidade - Aditamento está com valor menor ou igual a zero (Casos anteriores às alterações na regra implementadas no WO15750)
          If cdsAditamento.FieldByName('VL_ADITAMENTO').AsFloat <= 0 Then     // Paulo Nobre - WO22494
          Begin
            bAditamentoComParcelasSemValorBase := True;
            
            Application.MessageBox('O Valor deste Aditamento será ajustado conforme o saldo' + #13 + #13 +
                                   'do Contrato ou do saldo do Aditamento anterior.', 'Atenção: Aditamento não conforme', MB_ICONINFORMATION);

            chkReqReinicioParc.Enabled := False;
            // Buscando o valor base do contrato para corrigir esta distorção
            cdsSaldoContrato.Data := FCtrlContratos._BuscaUltimoSaldoContratoOuAditamento(Trunc(rIdContrato));
            // Paulo Nobre - WO22494 - Inicio
            edtValorAditado.Value := cdsSaldoContrato.fieldbyname('SALDO_A_PAGAR').AsFloat;
       //     cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsInteger := cdsSaldoContrato.fieldbyname('IDCONTRATO').AsInteger;  // Paulo Nobre - WO31928
            cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').AsString := 'S';
         //   edtValorAditado.Enabled := False;
            // Paulo Nobre - WO22494 - Fim
            rbAditamento.Enabled := False;
            rbOutros.Enabled := False;
            rbRegula.Enabled := False;       // Paulo Nobre - WO31928
            chkbImportaSaldo.Enabled := False;
          End;
      End;

      // Se o aditamento teve o valor importado do saldo do contrato ou de outro aditamento
   //   if (cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsString <> '') Then
   //   begin
  //      chkbImportaSaldo.Checked := True;
   //     chkbImportaSaldo.Enabled := False;
  //    end;
  
      // Paulo Nobre -  WO20776 - Fim

    end;
  end;
  //Fernando Xavier - SIG 41489

 // Paulo Nobre -  WO20776 - Inicio
 //   if cdsAditamento.State = dsInsert then begin
 //      if dData > 0    then cdsAditamento.FieldByName('DATAASSADITAMENTO').AsDateTime := dData;
 //      if sTexto <> '' then cdsAditamento.FieldByName('DESCADITAMENTO').AsString      := sTexto;
 //   end;
 // Paulo Nobre -  WO20776 - Fim 

  // Criando o valor do campo "Código"
  if not bAlterando then // Alterado por FHBS - 17/10/2019 - SIG81261
    if (rbAditamento.Checked) then
    begin
       cdsAditamento.FieldByName('CODADITAMENTO').AsInteger := FCtrlAditamento.GetCodAditamento(rIdContrato);
       dbeCodAditamento.ReadOnly := True;
    end;
  // Felipe A. Santos SOL 217597/17169 PPM 772732 - fim


  // Paulo Nobre - WO37036
  // Variavel "sNaoSeAplica" é carregada no form FCadContratoMT
  stCondicao.visible := (sNaoSeAplica = 'N');

end;

procedure TfrmCadAditamentoMT.bbtnConfirmarClick(Sender: TObject);
var
  cdsAux: TCMClientDataSet; // Alterado por FHBS - 16/10/2019 - SIG81261
  bAuxReqReinicioParc: Boolean; // Alterado por FHBS - 17/10/2019 - SIG81261
  sFlgSaldoTransf : String; // 20776
  geraParcela : Boolean;  // Paulo Nobre - WO40263
begin
  if (Trim(cdsAditamento.FieldByName('DATAASSADITAMENTO').AsString) = '') then begin
    MsgDlg('Obrigatório preencher a data da assinatura do aditamento','Atenção',mtWarning,[mbOk],0);
    dbtpDataAssinatura.SetFocus;
    Abort;
  end;
  if (Trim(cdsAditamento.FieldByName('CODADITAMENTO').AsString) = '' ) then begin
    MsgDlg('Obrigatório preencher o código do aditamento','Atenção',mtWarning,[mbOk],0);
    dbeCodAditamento.SetFocus;
    Abort;
  end;
  if (Trim(cdsAditamento.FieldByName('DESCADITAMENTO').AsString) = '') then begin
    MsgDlg('Obrigatório preencher a descrição do aditamento','Atenção',mtWarning,[mbOk],0);
    dbmemDescricao.SetFocus;
    Abort;
  end;

  // Paulo Nobre - WO38245 - Inicio

  // Paulo Nobre - WO22956 - Inicio
  if (chkReqReinicioParc.Checked) Then // and bAditamentoComParcelasSemValorBase = False) Then  // Paulo Nobre - WO22494
  begin
    // Paulo Nobre - WO37036 - Inicio

    if (sNaoSeAplica <> 'N') Then // Contratos com Valor
    begin
       if (edtValorAditado.value > 0) Then
       begin
        if cdsAditamento.State = dsInsert Then
        begin
          if (MsgDlg('A contagem das parcelas do Contrato ou Aditamento irá reiniciar, deseja prosseguir?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
            Abort;
        end;
       end
       else
       begin
         MsgDlg('Obrigatório preencher um Valor maior que Zero se for reiniciar parcelas.','Atenção',mtWarning,[mbOk],0);
         edtValorAditado.SetFocus;
         Abort;
       end;
    end
    else       // Contratos com condição "Não se Aplica" (sem valor)
    begin
       if (edtValorAditado.value <> 0) Then
       begin
         MsgDlg('Aditamento cujo Contrato tem condição "Não se Aplica" tem que ter Valor igual a ZERO.', 'Atenção',mtWarning,[mbOk],0);
         edtValorAditado.Value := 0.00;
         edtValorAditado.SetFocus;
         Abort;
       end
       else if cdsAditamento.State = dsInsert Then
       begin
         if (MsgDlg('A contagem das parcelas do Contrato ou Aditamento irá reiniciar, deseja prosseguir?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
           Abort;
       end;
    end;

    // Paulo Nobre - WO37036 - Fim

    // Paulo Nobre - WO38245 - Fim    

  end;
  // Paulo Nobre - WO22956 - Fim

  //Fernando Xavier - SIG 41489
  //if (cdsAditamento.State in [dsInsert]) then
  if (cdsAditamento.State in [dsInsert, dsEdit]) then
  //Fernando Xavier - SIG 41489
  begin
    // Felipe A. Santos SOL 218909/16724 PPM 588170  - Início Comentário - ER225 RNG07

    if (rbAditamento.Checked) and (cdsAditamento.FieldByName('VL_ADITAMENTO').AsFloat > 0) then   // Paulo Nobre -  WO15750
       cdsAditamento.FieldByName('FLGTIPO').AsString := 'A'     // Aditamento
    else if (rbOutros.Checked) then   // Paulo Nobre -  WO15750
       cdsAditamento.FieldByName('FLGTIPO').AsString := 'C'     // Outros
    else if (rbRegula.Checked) then                                                // Paulo Nobre - WO31928
       cdsAditamento.FieldByName('FLGTIPO').AsString := 'R';    // Regularização   // Paulo Nobre - WO31928

    // Felipe A. Santos SOL 218909/16724 PPM 588170  - fim Comentário - ER225 RNG07

  //  cdsAditamento.Post;
  //  cdsAditamento.edit;//Fernando Xavier - SIG 41489
  end;

  // Paulo Nobre - WO38245 - Inicio

  cdsAditamento.FieldByName('FLGSALDOTRANSFERIDO').AsString := 'S';
//  cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').AsString := 'N';      // Paulo Nobre - WO38948

  // Felipe A. Santos SOL 218909/16724 PPM 588170  - Início
  if (chkReqReinicioParc.Checked) Then
  begin

    // Paulo Nobre - WO40263 - Inicio
    geraParcela := True;
    cdsAditamento.FieldByName('FLGSALDOTRANSFERIDO').AsString := 'N';

    if (cdsAditamento.State in [dsEdit]) then
      geraParcela := not FCtrlAditamento._VerificaSeAditamentoTemParcelamento(Trunc(rIdContrato), cdsAditamento.FieldByName('IDADITAMENTO').AsInteger );

 //   if not FCtrlAditamento._VerificaSeAditamentoTemParcelamento(Trunc(rIdContrato), cdsAditamento.FieldByName('IDADITAMENTO').AsInteger ) Then
 //   begin

  // Paulo Nobre - WO38245 - Fim

     // Paulo Nobre - WO15750 - Inicio
     // Se o aditamento teve o valor importado do saldo do contrato
     // ou de outro aditamento, ou seja, neste campo terá um ID,
     // então, não precisa reiniciar as parcelas.
  //   (cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsString = '') Then     // Paulo Nobre - WO31928
     // Paulo Nobre - WO15750 - Fim
     // Alterado por FHBS - 16/10/2019 - SIG81261
     // Em alinhamento interno, verificamos que a opção 03, é a que melhor atende a
     // funcionalidade de Alteração do Aditamento.
     // 3. Alteram-se as demais informações (Data Assinatura, Código e Descrição) ,
     // mas não apaga nenhuma das medições e exibe uma mensagem informando que já existe
     // parcela medida e que não se pode reiniciar a contagem.

    if geraParcela Then
    begin

       bAuxReqReinicioParc := True; // Alterado por FHBS - 17/10/2019 - SIG81261
       if cdsAditamento.FieldByName('IDADITAMENTO').AsInteger <> 0 then // Alterado por FHBS - 21/11/2019 - SIG94164
       try
         cdsAux := TCMClientDataSet.Create(Self);

         cdsServProdxItemContr.First;
         while not(cdsServProdxItemContr.Eof) and (bAuxReqReinicioParc) do
         begin
           if cdsAux.Active then cdsAux.Close;
           cdsAux.Data := FCtrlAditamento.GetDataPacket(
                    'SELECT COUNT(1) FROM CTRLPARCELAMEDICAO ' +
                    ' WHERE IDCONTRATO = ' + CdsServProdXItemContr.FieldByName('IDCONTRATO').AsString +
                    '   AND IDOBJETO = ' + CdsServProdXItemContr.FieldByName('IDOBJETO').AsString +
                    '   AND IDITEM = ' + CdsServProdXItemContr.FieldByName('IDITEM').AsString +
                    '   AND IDADITAMENTO = ' + cdsAditamento.FieldByName('IDADITAMENTO').AsString +
                    '   AND FLGPARCELAMEDIDA = 1 AND NOT IDMEDICAO IS NULL');

           if cdsAux.Fields[0].AsInteger > 0 then
           begin
             MsgDlg('Já existe parcela medida e que não se pode reiniciar a contagem','Atenção',mtWarning,[mbOk],0);
             bAuxReqReinicioParc := False;
           end;

            cdsServProdxItemContr.Next;

         end;
       finally
         cdsAux.Close;
         FreeAndNil(cdsAux);
       end;
      // Alterado por FHBS - 16/10/2019 - SIG81261
       // Paulo Nobre - WO28914 - Inicio
      //    if bAuxReqReinicioParc then // Alterado por FHBS - 17/10/2019 - SIG81261
     //    begin
       FCtrlCtrlParcelaMedicao.InserirCtrlParcelaMedicao(cdsServProdxItemContr, cdsCtrlParcelaMedicao, true);
     end;

   //    cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').AsString := 'S';   // Paulo Nobre - WO38245

 //   end;

    // Paulo Nobre - WO40263 - Fim

    // Se reiniciar parcelas, então o novo aditamento passará a ser o que vai receber as medições
    // então por garantia, o contrato e os aditamentos anteriores ficarão indisponíveis

    // Indisponibilizando o Contrato
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('UPDATE CM.CONTRATOCONTR SET FLGSALDOTRANSFERIDO = ''S'' ');
    qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
    qryAux.Execsql;

    // Atualizando os Aditamentos anteriores
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('UPDATE CM.ADITAMENTO SET FLGSALDOTRANSFERIDO = ''S'' ');
    qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
    qryAux.Execsql;    

    // Paulo Nobre - WO40263 - Fim

       // Alterado por FHBS - 14/10/2019 - SIG81261
       // Para que seja possível o reinício da contagem, deve-se apagar os registros associados
       // ao aditamento que está sendo alterado, desde que estes não tenham sidos registrados,
       // ou seja, de possuírem os campos FLGPARCELAMEDIDA = 1 e IDMEDICAO <> NULL.
{       cdsServProdxItemContr.First;
       while not(cdsServProdxItemContr.Eof) do
       begin
         FCtrlAditamento.ExecSQL('DELETE FROM CTRLPARCELAMEDICAO ' +
                                 ' WHERE IDCONTRATO = ' + CdsServProdXItemContr.FieldByName('IDCONTRATO').AsString +
                                 '   AND IDOBJETO = ' + CdsServProdXItemContr.FieldByName('IDOBJETO').AsString +
                                 '   AND IDITEM = ' + CdsServProdXItemContr.FieldByName('IDITEM').AsString +
                                 '   AND IDADITAMENTO = ' + cdsAditamento.FieldByName('IDADITAMENTO').AsString +
                                 '   AND FLGPARCELAMEDIDA <> 1 AND IDMEDICAO IS NULL');

         cdsServProdxItemContr.Next;
       end;
       // Fim - Alterado por FHBS - 14/10/2019 - SIG81261      }
  //   end;

    // Paulo Nobre - WO28914 - Fim
  end;
  // Felipe A. Santos SOL 218909/16724 PPM 588170  - fim

  // Paulo Nobre - WO28914 - Inicio

  // Paulo Nobre - WO22956 - Inicio
  // Paulo Nobre - WO20776 - Inicio
  // Paulo Nobre - WO15750 - Inicio
//  if (chkbImportaSaldo.checked and chkReqReinicioParc.Checked) or (bAditamentoComParcelasSemValorBase) Then

  // Paulo Nobre - WO31928 - Inicio

  // Se reiniciar parcelas, então o novo aditamento passará a ser o que vai receber as medições
  // e o contrato e os aditamentos anteriores ficarão indisponíveis
//  if (chkReqReinicioParc.Checked) Then // or bAditamentoComParcelasSemValorBase) Then
//  begin
    // Atualizando o Contrato
{    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('UPDATE CM.CONTRATOCONTR SET FLGSALDOTRANSFERIDO = ''S'' ');
    qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
    qryAux.Execsql;

    // Atualizando os Aditamentos anteriores
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('UPDATE CM.ADITAMENTO SET FLGSALDOTRANSFERIDO = ''S'' ');
    qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
    qryAux.Execsql;              }

    // Garantindo que se o aditamento teve parcelamentos reiniciados, a flag abaixo esteja com 'S'
//    If (bAditamentoComParcelasSemValorBase) Then
 //   cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').AsString := 'S';

{    // Se o Valor foi lançado manualmente
    if (chkbImportaSaldo.checked = False) Then
    begin
       // Aproveitando esta função apenas para pegar o IDADITAMENTO anterior
       cdsSaldoContrato.Data := FCtrlContratos._BuscaUltimoSaldoContratoOuAditamento(Trunc(rIdContrato));
    end;

    // Salvando no aditamento corrente o id do contrato ou aditamento do qual o saldo foi transferido
    If (cdsSaldoContrato.fieldbyname('IDADITAMENTO').AsFloat = 0) or (bAditamentoComParcelasSemValorBase) Then
    begin
      cdsAditamento.FieldByName('ORIGEMVALORTRANSF').AsString := 'C';
      cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsFloat := rIdContrato;

      // Atualizando o Contrato
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('UPDATE CM.CONTRATOCONTR SET FLGSALDOTRANSFERIDO = ''S'' ');
      qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
      qryAux.EXECSQL;
    end
    else
    begin
      cdsAditamento.FieldByName('ORIGEMVALORTRANSF').AsString := 'A';
      cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsFloat := cdsSaldoContrato.fieldbyname('IDADITAMENTO').AsFloat;

      // Atualizando o Aditamento anterior
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('UPDATE CM.ADITAMENTO SET FLGSALDOTRANSFERIDO = ''S'' ');
      qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
      qryAux.Sql.Add('      AND IDADITAMENTO = ' + cdsSaldoContrato.fieldbyname('IDADITAMENTO').AsString );
      qryAux.EXECSQL;
    end;
}

    // Paulo Nobre - WO31928 - Fim

    // Chamado pela funcionalidade de alteração de aditamentos
{    if (sChamador = 'cadAdit') then
    Begin
      // Marcar o contrato ou o ultimo aditamento com a marcação de saldo transferido
      FCtrlContratos._AtualizaFlgSaldoTransf(Trunc(rIdContrato),
                                             cdsSaldoContrato.FieldByName('IDADITAMENTO').AsInteger,
                                             chkbImportaSaldo.checked,
                                             edtValorAditado.value);

      // Atualizando o Contrato
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('UPDATE CM.CONTRATOCONTR SET FLGSALDOTRANSFERIDO = ''S'' ');
      qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
      qryAux.EXECSQL;      }
//  end;
{  else    // Entrando com a valor manual
  begin
    //
    // Tanto tipo = "Aditamento" ou "Outros", se reiniciar parcelas,
    // o contrato ou aditamento anterior será indisponibilizado
    if (chkReqReinicioParc.Checked) then
    Begin
    // Neste caso, será necessário indisponibilizar o aditamento anterior, para isso será necessário
    // usar uma macete neste aditamento anterior para colocar o campo FLGSALDOTRANSFERIDO = 'I' (Indisponibilizado, na marra)

    // Aproveitando esta função apenas para pegar o IDADITAMENTO anterior
    cdsSaldoContrato.Data := FCtrlContratos._BuscaUltimoSaldoContratoOuAditamento(Trunc(rIdContrato));
    cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsFloat := cdsSaldoContrato.fieldbyname('IDADITAMENTO').AsFloat;

//    sFlgSaldoTransf := 'N';
//    if (edtValorAditado.value <> 0) Then
    sFlgSaldoTransf := 'I';  // Indisponível

    // Atualizando o Aditamento anterior
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('UPDATE CM.ADITAMENTO SET FLGSALDOTRANSFERIDO = ' + QuotedStr(sFlgSaldoTransf) );
    qryAux.Sql.Add('WHERE IDCONTRATO = ' + inttostr(Trunc(rIdContrato)) );
    qryAux.Sql.Add('      AND IDADITAMENTO = ' + cdsSaldoContrato.fieldbyname('IDADITAMENTO').AsString );
    qryAux.EXECSQL;
  end;   }
  // Paulo Nobre -  WO15750 - Fim
  // Paulo Nobre - WO22956 - Fim

  // Paulo Nobre - WO28914 - Fim

  ModalResult := mrOk;
 // inherited;
end;

procedure TfrmCadAditamentoMT.rbAditamentoClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 217597/17169 PPM 772732 - início
  if not bAlterando then // Alterado por FHBS - 17/10/2019 - SIG81261
    if (rbAditamento.Checked) then
    begin
       cdsAditamento.FieldByName('CODADITAMENTO').AsInteger := FCtrlAditamento.GetCodAditamento(rIdContrato);
       dbeCodAditamento.ReadOnly := True;
    end;
  // Felipe A. Santos SOL 217597/17169 PPM 772732 - fim
end;

procedure TfrmCadAditamentoMT.rbOutrosClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 217597/17169 PPM 772732 - início
  if not bAlterando then // Alterado por FHBS - 17/10/2019 - SIG81261
    if (rbOutros.Checked) then
    begin
      cdsAditamento.FieldByName('CODADITAMENTO').AsString := '';
      dbeCodAditamento.ReadOnly := False;
    end;
  // Felipe A. Santos SOL 217597/17169 PPM 772732 - fim

  // Paulo Nobre - WO15750 - Inicio
  cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').AsString := 'N';
  chkReqReinicioParc.Checked := False;
  chkbImportaSaldo.Checked := False;
  edtValorAditado.Value := 0.00;    
  // Paulo Nobre - WO15750 - Fim
  
end;

procedure TfrmCadAditamentoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FCtrlAditamento); // Felipe A. Santos SOL 217597/17169 PPM 772732

  FreeAndNil(FCtrlContratos);    // Paulo Nobre -  WO15750

  inherited;

end;

// Paulo Nobre -  WO15750 - Inicio
procedure TfrmCadAditamentoMT.chkbImportaSaldoClick(Sender: TObject);
begin
  inherited;
  If chkbImportaSaldo.Checked then
  begin
    // Paulo Nobre - WO28914 - Inicio
    edtValorAditado.Font.Color := clblack;
    edtValorAditado.Font.Style := [];
    // Buscar saldo do contrato/aditamento e colocar no campo valor
    cdsSaldoContrato.Data := FCtrlContratos._BuscaUltimoSaldoContratoOuAditamento(Trunc(rIdContrato));
    edtValorAditado.Value := cdsSaldoContrato.fieldbyname('SALDO_A_PAGAR').AsFloat;
    if edtValorAditado.Value < 0 Then
    begin
      edtValorAditado.Font.Color := clred;
      edtValorAditado.Font.Style := [fsBold];
    end;
    // Paulo Nobre - WO28914 - Fim    
 //   edtValorAditado.Enabled := False;                                                 Paulo Nobre -  WO20776
  end
  else
  begin
    edtValorAditado.Enabled := True;
    edtValorAditado.Value := 0.00;
    chkReqReinicioParc.Checked := False;
    edtValorAditado.setfocus;
  end;

end;
// Paulo Nobre -  WO15750 - Fim

// Paulo Nobre -  WO20776 - Inicio
// Paulo Nobre -  WO15750 - Inicio
procedure TfrmCadAditamentoMT.FormPaint(Sender: TObject);
begin
{  if cdsAditamento.State = dsEdit then
  begin
    // Aditamento tem parcelamento
    If FCtrlContratos._VerificaSeAditamentoTemParcelamento(Trunc(rIdContrato), cdsAditamento.FieldByName('IDADITAMENTO').AsInteger ) Then
    Begin
        // Distorção - Aditamento está com valor zerado (Para caso anteriores às alterações na regra implementadas no WO15750)
        If cdsAditamento.FieldByName('VL_ADITAMENTO').AsFloat = 0 Then
        Begin
          Application.MessageBox('O Valor do Aditamento será ajustado conforme o novo saldo' + #13 + #13 +
                                 'do Contrato ou do novo saldo do Aditamento anterior.', 'Atenção', MB_ICONINFORMATION);

          chkReqReinicioParc.Enabled := False;
          // Buscando o valor base do contrato para corrigir esta distorção
          cdsSaldoContrato.Data := FCtrlContratos._BuscaUltimoSaldoContratoOuAditamento(Trunc(rIdContrato));
          edtValorAditado.Value := cdsSaldoContrato.fieldbyname('VALORBASECONTRATO').AsFloat;
          edtValorAditado.Enabled := False;
          chkbImportaSaldo.Checked := True;
          chkbImportaSaldo.Enabled := False;
        End;
    End;

    {  If (cdsAditamento.FieldByName('FLGREINICIODASPARCELAS').AsString = 'N') Then
      Begin
        // Buscando o ultimo saldo do contrato ou ultimo aditamento
        cdsSaldoContrato.Data := FCtrlContratos._BuscaUltimoSaldoContratoOuAditamento(Trunc(rIdContrato));
        if (cdsSaldoContrato.fieldbyname('SALDO_A_PAGAR').AsFloat <> cdsAditamento.FieldByName('VL_ADITAMENTO').AsFloat) Then
        begin
          Application.MessageBox('O Valor do Aditamento será ajustado conforme o novo saldo' + #13 + #13 +
                                 'do Contrato ou do novo saldo do Aditamento anterior.', 'Atenção', MB_ICONINFORMATION);

          edtValorAditado.Value := cdsSaldoContrato.fieldbyname('SALDO_A_PAGAR').AsFloat;
          edtValorAditado.Enabled := False;
      end;
    end;

    // Se o aditamento teve o valor importado do saldo do contrato ou de outro aditamento
    if (cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsString <> '') Then
    begin
      chkbImportaSaldo.Checked := True;
      chkbImportaSaldo.Enabled := False;
    end;                     }
end;
// Paulo Nobre -  WO15750 - Fim
// Paulo Nobre -  WO20776 - Fim

// Paulo Nobre -  WO31928 - Inicio
procedure TfrmCadAditamentoMT.rbRegulaClick(Sender: TObject);
begin
  inherited;
 if not bAlterando then
    if (rbRegula.Checked) then
    begin
      cdsAditamento.FieldByName('CODADITAMENTO').AsString := 'REGULARIZA';
      dbeCodAditamento.ReadOnly := False;
    end;
end;
// Paulo Nobre -  WO31928 - Fim

end.
