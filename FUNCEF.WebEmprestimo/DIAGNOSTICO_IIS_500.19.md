# DIAGNÓSTICO DE PROBLEMAS WCF - IIS 10.0 Erro 500.19

## ❌ PROBLEMA IDENTIFICADO

**Erro IIS 10.0 - 500.19 - Internal Server Error** indica problema de configuração no `web.config`.

**Sintomas observados:**
- Conflito de content-type: `text/html` vs `multipart/related`  
- Problemas com encoding MTOM em WCF
- Erro de associação de mensagem

## ✅ CORREÇÕES APLICADAS

### 1. **Configuração WCF - Binding MTOM Corrigido**
```xml
<!-- ANTES (problemático) -->
<binding name="ServicosWebEmprestimoHttpVolume" messageEncoding="Mtom" />

<!-- DEPOIS (corrigido) -->
<binding name="ServicosWebEmprestimoHttpVolume" messageEncoding="Text" />
```

### 2. **System.Web - Atualizado para .NET 4.8**
```xml
<system.web>
  <httpRuntime targetFramework="4.8" />
  <compilation targetFramework="4.8" />
  <globalization requestEncoding="utf-8" responseEncoding="utf-8" />
</system.web>
```

### 3. **Handler WCF - Habilitado para IIS Integrado**
```xml
<handlers>
  <add name="svc-Integrated-4.0" path="*.svc" verb="*" 
       type="System.ServiceModel.Activation.ServiceHttpHandlerFactory, 
             System.ServiceModel.Activation, Version=4.0.0.0" 
       preCondition="integratedMode,runtimeVersionv4.0" />
</handlers>
```

## 🔧 DIAGNÓSTICO ADICIONAL

### **Verificar IIS Application Pool:**
1. **Framework Version**: .NET Framework v4.0 (ou superior)
2. **Managed Pipeline Mode**: Integrated
3. **Enable 32-Bit Applications**: False (para 64-bit)

### **Verificar Permissions:**
```cmd
# Dar permissão IIS_IUSRS na pasta da aplicação
icacls "C:\path\to\app" /grant IIS_IUSRS:(OI)(CI)F
```

### **Verificar Features do Windows:**
- IIS → Application Development Features → ASP.NET 4.8
- IIS → Application Development Features → .NET Extensibility 4.8
- WCF Services → HTTP Activation

## 🚨 PROBLEMAS COMUNS E SOLUÇÕES

### **Erro 500.19 - Seção de configuração desconhecida**
```xml
<!-- Verificar se todas as seções estão declaradas corretamente -->
<configSections>
  <section name="oracle.manageddataaccess.client" ... />
</configSections>
```

### **Erro MTOM Content-Type**
```xml
<!-- Usar Text encoding em vez de MTOM se houver problemas -->
<binding messageEncoding="Text" textEncoding="utf-8" />
```

### **Erro Assembly Loading**
```xml
<runtime>
  <assemblyBinding>
    <!-- Binding redirects corretos -->
  </assemblyBinding>
</runtime>
```

## 📋 CHECKLIST DE VERIFICAÇÃO

### ✅ **Configuração Web.config:**
- [x] Seções declaradas corretamente
- [x] TargetFramework 4.8 especificado
- [x] Encoding UTF-8 configurado
- [x] Handler WCF habilitado
- [x] Binding WCF usando Text encoding

### ✅ **Ambiente IIS:**
- [ ] Application Pool com .NET 4.8
- [ ] Modo Integrado habilitado
- [ ] Permissões corretas na pasta
- [ ] Features ASP.NET 4.8 instalados

### ✅ **Dependencies:**
- [x] Oracle.ManagedDataAccess configurado
- [x] Binding redirects corretos
- [x] Enterprise Library configurado

## 🎯 **PRÓXIMOS PASSOS**

1. **Testar a aplicação** após as correções aplicadas
2. **Verificar logs do IIS** em caso de persistência do erro
3. **Aplicar downgrade Oracle** se problemas de assembly continuarem
4. **Verificar configuração específica do ambiente** de produção

As correções aplicadas devem resolver os problemas de configuração WCF e compatibilidade com IIS 10.0.