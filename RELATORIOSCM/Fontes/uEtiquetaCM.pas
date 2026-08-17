unit uEtiquetaCM;

interface

Uses uGImp, Classes, WwQuery, uDataBase, Forms, SysUtils, uFuncaoGeral;

Type
  TEtiquetaCm = Class
  Private
    gimpEtiq : Tgimp;
    FModeloEtiq, FNumColunas, FNumCharLargura, FNumLinhas, FNumLinhasEspaco,
    FNumCharEntreEtiq: Integer;
    FQryConfig: TwwQuery;
    Procedure GetModeloEtiq(Value: Integer);
  Public
    Constructor Create;
    Destructor  Destroy; Override;
    Procedure   Imprime(QryDados: TwwQuery;sTexto: String);
    Procedure   AbrirFormConfig;
    Procedure   AbrirFormImpressao;
    Property    ModeloEtiq       : Integer read FModeloEtiq       Write GetModeloEtiq;
    Property    NumColunas       : Integer read FNumColunas       Write FNumColunas;
    Property    NumCharLargura   : Integer read FNumCharLargura   Write FNumCharLargura;
    Property    NumLinhas        : Integer read FNumLinhas        Write FNumLinhas;
    Property    NumLinhasEspaco  : Integer read FNumLinhasEspaco  Write FNumLinhasEspaco;
    Property    NumCharEntreEtiq : Integer read FNumCharEntreEtiq Write FNumCharEntreEtiq;
End;

Var EtiquetaCm: TEtiquetaCm;

implementation

Uses
  FConfigEtiq, FTelaAut, FImpEtiq;

Constructor TEtiquetaCm.Create;
Begin
   inherited Create;
   FQryConfig := TwwQuery.Create(Application);
   FQryConfig.DatabaseName     := 'BaseDados';
   gimpEtiq                    := Tgimp.Create(Application);
   gimpEtiq.DataBaseName       := 'BaseDados';
   gimpEtiq.MostraPrinterSetup := True;
   gimpEtiq.EjetarPagina       := True;
   gimpEtiq.Condensado         := True;
End;

Destructor TEtiquetaCm.Destroy;
Begin
   FQryConfig.Close;
   FQryConfig.Free;
   gimpEtiq.Free;
   Inherited Destroy;
End;

Procedure TEtiquetaCm.GetModeloEtiq(Value: Integer);
Begin
   If FazQuery(FQryConfig,'SELECT NUMCOLUNAS, NUMCHARLARGURA, NUMLINHAS, NUMLINHASESPACO, NUMCHARENTREETIQ ' +
                          'FROM ETIQUETA WHERE IDETIQUETA = ' + IntToStr(Value)) Then
   Begin
      FNumColunas       := FQryConfig.Fields[0].AsInteger;
      FNumCharLargura   := FQryConfig.Fields[1].AsInteger;
      FNumLinhas        := FQryConfig.Fields[2].AsInteger;
      FNumLinhasEspaco  := FQryConfig.Fields[3].AsInteger;
      FNumCharEntreEtiq := FQryConfig.Fields[4].AsInteger;
   End
   Else
   Begin
      FNumColunas       := 2;
      FNumCharLargura   := 45;
      FNumLinhas        := 5;
      FNumLinhasEspaco  := 1;
      FNumCharEntreEtiq := 2;
   End;
   FModeloEtiq := Value;
End;

Procedure TEtiquetaCm.AbrirFormConfig;
Begin
  AbrirForm(FrmConfigEtiq,TFrmConfigEtiq,False);
End;

Procedure TEtiquetaCm.AbrirFormImpressao;
Begin
  AbrirForm(FrmImpEtiq,TFrmImpEtiq,False);
End;

Procedure TEtiquetaCm.Imprime(QryDados: TwwQuery;sTexto: String);
Var
   X, iLinhasTexto: Integer;
   LinhasImp: Array [0..4] of String;
Begin
   If Trim(sTexto) <> '' Then
      sTexto := ' - ' + sTexto;

   If gimpEtiq.Inicializar Then
   Begin
      gimpEtiq.EjetarPagina           := True;
      gimpEtiq.SaltodeLinhaCondensado := False;
      gimpEtiq.Condensado             := True;
      gimpEtiq.TipoFonte              := TfNormal;

      iLinhasTexto := 5;

      With QryDados do
      Begin
          Open;
          First;
          While Not Eof Do
          Begin
              For X:=0 To 4 Do
                 LinhasImp[x] := '';

              //Centralização dos Dados na Etiqueta
              If ((FNumLinhas - 5) Div 2) > 0 Then
                 For X:=1 To ((FNumLinhas - 5) Div 2) Do
                     gimpEtiq.ImprimirTexto(' ');

              For X:= 1 To FNumColunas Do
              Begin
                 If Not Eof Then
                 Begin
                   LinhasImp[0] := LinhasImp[0] +
                                   FuncaoGeral.Spc(FNumCharEntreEtiq) +
                                   FuncaoGeral.AE(FieldByName('Nome').AsString,FNumCharLargura);

                   LinhasImp[1] := LinhasImp[1] +
                                   FuncaoGeral.Spc(FNumCharEntreEtiq) +
                                   FuncaoGeral.AE(FieldByName('Logradouro').AsString +
                                                  ' ' +
                                                  FieldByName('Numero').AsString,FNumCharLargura);

                   If Not FieldByName('Complemento').IsNull Then
                      LinhasImp[2] := LinhasImp[2] +
                                      FuncaoGeral.Spc(FNumCharEntreEtiq) +
                                      FuncaoGeral.AE(FieldByName('Complemento').AsString +
                                                     ' - ' +
                                                     FieldByName('Bairro').AsString,FNumCharLargura)
                   Else
                      LinhasImp[2] := LinhasImp[2] +
                                      FuncaoGeral.Spc(FNumCharEntreEtiq) +
                                      FuncaoGeral.AE(FieldByName('Bairro').AsString,FNumCharLargura);


                   Case FNumLinhas of
                   4:
                     Begin
                       LinhasImp[3] := LinhasImp[3] +
                                       FuncaoGeral.Spc(FNumCharEntreEtiq) +
                                       FuncaoGeral.AE(FieldByName('Cidade').AsString +
                                       ' ' +
                                       FieldByName('CodEstado').AsString +
                                       ' ' +
                                       FieldByName('Cep').AsString + sTexto,FNumCharLargura);
                       iLinhasTexto  := 3;
                     End;
                   Else
                     Begin
                       LinhasImp[3] := LinhasImp[3] +
                                       FuncaoGeral.Spc(FNumCharEntreEtiq) +
                                       FuncaoGeral.AE(FieldByName('Cidade').AsString,FNumCharLargura);

                       LinhasImp[4] := LinhasImp[4] +
                                       FuncaoGeral.Spc(FNumCharEntreEtiq) +
                                                   FuncaoGeral.AE(FieldByName('CodEstado').AsString +
                                                   ' ' +
                                                   FieldByName('Cep').AsString + sTexto,FNumCharLargura);
                       iLinhasTexto  := 4;
                     End
                   End;

                   Next;
                 End;
              End;

              //Imprime Etiquetas
              For X:=0 To iLinhasTexto Do
                  gimpEtiq.ImprimirTexto(LinhasImp[x]);

              //Salto entre etiquetas
              For X:=1 To FNumLinhasEspaco Do
                  gimpEtiq.ImprimirTexto(' ');
          End;
          Close;
      End;

      gimpEtiq.Finalizar;
   End;
End;

end.
